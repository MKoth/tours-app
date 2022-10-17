import { Component, OnInit } from '@angular/core';

let map:google.maps.Map;

@Component({
  selector: 'app-edit-post-map',
  templateUrl: './edit-post-map.component.html',
  styleUrls: ['./edit-post-map.component.less']
})
export class EditPostMapComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewPost") as HTMLElement, mapProp);
  }

}
