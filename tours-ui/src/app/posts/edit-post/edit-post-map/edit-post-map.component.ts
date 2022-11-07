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

  @Input() post:Post|{point:string} = {point:""};

  constructor() { }

  ngOnInit(): void {
    const myLatlng = this.post.point.split(",").map(pos=>parseFloat(pos));

    let mapProp = {
      center: new google.maps.LatLng(myLatlng[0], myLatlng[1]),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewPost") as HTMLElement, mapProp);

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(myLatlng[0], myLatlng[1]),
      title:"Hello World!"
    });
  }

  assignEvent() {
    map.addListener("click", this.addMarker);
  }

  addMarker(event:any) {
    marker.setPosition(event.latLng);
  }

  get point() {
    return marker.getPosition()?.toString();
  }
}
