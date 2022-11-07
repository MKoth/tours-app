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
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewTour") as HTMLElement, mapProp);

    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
    });
  
    poly.setMap(map);
    event = map.addListener("click", this.addLatLng);
    this.addExistingPostsToPath();
  }

  addExistingPostsToPath() {
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
      newMarker.addListener("dragend", (e: google.maps.MapMouseEvent) => { this.onMarkerDragEnd(e, post, path.getLength()-1) } );
      markers.push(newMarker);
    });
  }

  onMarkerDragEnd(event: google.maps.MapMouseEvent, post: Post, pathIndex:number) {
    poly.getPath().setAt(pathIndex, event.latLng as google.maps.LatLng);
    post.point = event.latLng?.toString() as string;
  }

  addLatLng(event:any) {
    const path = poly.getPath();
    path.push(event.latLng);
    const newMarker = new google.maps.Marker({
      label: "Tours post no. " + markers.length,
      map: map,
      position: event.latLng,
      draggable: true
    });
    markers.push(newMarker);
    const post = {
      name: "Post for no. " + markers.length,
      text: "Sample text here!",
      image: "/assets/empty-post.jpeg",
      point: event.latLng.toString(),
      period_start: 0,
      period_end: 0,
      creator_id: '',
      city: {name:"", id:0, point:""},
      tags: [],
      layer: {},
      tour: this.tour,
      ordering: markers.length
    };
    this.tour.locations.push(post);
    newMarker.addListener("dragend", (e: google.maps.MapMouseEvent) => { this.onMarkerDragEnd(e, post, path.getLength()-1) });
  }

  clearLine() {
    const path = poly.getPath();
    path.clear();
    markers.forEach(value=>value.setMap(null));
    markers = [];
    this.unassignedPosts = structuredClone(this.tour.locations);
    this.tour.locations = [];
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
  }

  setPostToBeReplaced(toBeReplacePost: Post) {
    this.toBeReplacePost = toBeReplacePost;
  }

  replacePost(newPost:Post) {
    const index = this.tour.locations.indexOf(this.toBeReplacePost as Post);
    if (index >= 0 ) {
      this.tour.locations[index] = newPost;
    }
  }

  get path() {
    return this.tour.locations;
  }
}
