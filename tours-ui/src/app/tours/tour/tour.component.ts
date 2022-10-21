import { Component, OnInit } from '@angular/core';

let map:google.maps.Map;

@Component({
  selector: 'app-tour',
  templateUrl: './tour.component.html',
  styleUrls: ['./tour.component.less']
})
export class TourComponent implements OnInit {

  posts:Array<number> = [0,1,2,3,4,5,6,7,8,9,10,11];

  constructor() { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapTour") as HTMLElement, mapProp);
  }

}
