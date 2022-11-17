import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { Component, Input, OnInit } from '@angular/core';
import { Post } from 'src/app/posts/post.service';
import { Tour } from '../../tour.service';

let map:google.maps.Map;
let poly:google.maps.Polyline;
let markers: Array<google.maps.Marker> = [];
let event:google.maps.MapsEventListener;

@Component({
  selector: 'app-edit-tours-map',
  templateUrl: './edit-tours-map.component.html',
  styleUrls: ['./edit-tours-map.component.less']
})
export class EditToursMapComponent implements OnInit {

  @Input() tour:Tour|{locations:Post[]} = {locations:[]};
  defaultLatLng = ["41.879","-87.624"];
  unassignedPosts:Post[] = [];
  toBeReplacePost: Post|null = null;

  constructor() { }

  ngOnInit(): void {
    const startPoint = this.tour?.locations.length?this.tour?.locations[1].point.split(","):this.defaultLatLng;
    let mapProp = {
      center: new google.maps.LatLng(parseFloat(startPoint[0]),parseFloat(startPoint[1])),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewTour") as HTMLElement, mapProp);

    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
    });
  
    poly.setMap(map);
    event = map.addListener("click", (e:any)=>this.addLatLng(e));
    this.redrawLocationsToMap();
  }

  redrawLocationsToMap() {
    this.clearPath();
    const path = poly.getPath();
    this.tour.locations.forEach(post=>{
      const point = post.point.split(",").map(loc=>parseFloat(loc));
      const latLng = new google.maps.LatLng(point[0], point[1]);
      path.push(latLng);
      const newMarker = new google.maps.Marker({
        label: post.name,
        map: map,
        position: latLng,
        draggable: true
      });
      newMarker.addListener("dragend", (e: google.maps.MapMouseEvent) => { this.onMarkerDragEnd(e, post) } );
      markers.push(newMarker);
    });
  }

  onMarkerDragEnd(event: google.maps.MapMouseEvent, post: Post) {
    post.point = event.latLng!.lat()+","+event.latLng!.lng();
    this.redrawLocationsToMap();
  }

  addLatLng(event:any) {
    const path = poly.getPath();
    path.push(event.latLng);
    const newMarker = new google.maps.Marker({
      label: "Post for no. " + (markers.length+1),
      map: map,
      position: event.latLng,
      draggable: true
    });
    markers.push(newMarker);
    const post = {
      name: "Post for no. " + markers.length,
      text: "Sample text here!",
      image: "/assets/empty-post.jpeg",
      point: event.latLng.lat()+","+event.latLng.lng(),
      period_start: 0,
      period_end: 0,
      creator_id: '',
      city: {name:"", id:0, point:""},
      tags: [],
      layer: {},
      ordering: markers.length
    };
    this.tour.locations.push(post);
    newMarker.addListener("dragend", (e: google.maps.MapMouseEvent) => { this.onMarkerDragEnd(e, post) });
  }

  clearLocations() {
    this.clearPath();
    this.tour.locations = [];
    this.unassignedPosts = structuredClone(this.tour.locations.filter(post=>post.id));
  }

  clearPath() {
    const path = poly.getPath();
    path.clear();
    markers.forEach(value=>value.setMap(null));
    markers = [];
  }

  cancelLastStroke() {
    const path = poly.getPath();
    path.pop();
    markers.pop()?.setMap(null);
    const removedPost = this.tour.locations.pop();
    if (removedPost?.id) {
      this.unassignedPosts.push(removedPost);
    }
  }

  getPointsCount():number {
    return poly? poly.getPath().getLength():0;
  }

  onReorderPosts(e: CdkDragDrop<Post[]>) {
    moveItemInArray(this.tour.locations, e.previousIndex, e.currentIndex);
    this.redrawLocationsToMap();
    this.tour.locations.forEach((post, index)=>{post.ordering = index+1});
  }

  setPostToBeReplaced(toBeReplacePost: Post) {
    this.toBeReplacePost = toBeReplacePost;
  }

  replacePost(newPost:Post) {
    const index = this.tour.locations.indexOf(this.toBeReplacePost as Post);
    if (index >= 0 ) {
      this.tour.locations[index] = newPost;
    }
    this.redrawLocationsToMap();
  }

  swapPost(postToSwap: Post) {
    const index1 = this.tour.locations.indexOf(this.toBeReplacePost as Post);
    const index2 = this.tour.locations.indexOf(postToSwap);
    this.tour.locations[index1] = postToSwap;
    this.tour.locations[index2] = this.toBeReplacePost!;
    const {ordering, point} = postToSwap;
    postToSwap.ordering = this.toBeReplacePost!.ordering;
    postToSwap.point = this.toBeReplacePost!.point;
    this.toBeReplacePost!.ordering = ordering;
    this.toBeReplacePost!.point = point;
    this.redrawLocationsToMap();
  }

  get path() {
    return this.tour.locations;
  }
}
