import { Component, Input, OnInit } from '@angular/core';
import { Post } from '../../post.service';

let map:google.maps.Map;
let marker:google.maps.Marker;

@Component({
  selector: 'app-edit-post-map',
  templateUrl: './edit-post-map.component.html',
  styleUrls: ['./edit-post-map.component.less']
})
export class EditPostMapComponent implements OnInit {

  @Input() post:Post|{point:string} = {point:"41.879,-87.624"};

  constructor() { }

  ngOnInit(): void {
    const myLatlng = this.post.point.split(",").map(pos=>parseFloat(pos));
    const label = (this.post as Post).text? (this.post as Post).text : "No title";

    let mapProp = {
      center: new google.maps.LatLng(myLatlng[0], myLatlng[1]),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewPost") as HTMLElement, mapProp);

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(myLatlng[0], myLatlng[1]),
      label: label,
      map
    });
  }

  assignEvent() {
    map.addListener("click", this.addMarker);
  }

  addMarker(event:any) {
    marker.setPosition(event.latLng);
  }

  get point() {
    return marker.getPosition()?.lat()+","+marker.getPosition()?.lat();
  }
}
