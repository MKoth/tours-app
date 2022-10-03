import { Component, OnInit } from '@angular/core';

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

  constructor() { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
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
  }

  addLatLng(event:any) {
    const path = poly.getPath();
    path.push(event.latLng);
    markers.push(new google.maps.Marker({
      label: "Tours post no. " + (markers.length + 1),
      map: map,
      position: event.latLng
    }));
  }

  clearLine() {
    const path = poly.getPath();
    path.clear();
    markers.forEach(value=>value.setMap(null));
    markers = [];
  }

  cancelLastStroke() {
    const path = poly.getPath();
    path.pop();
    markers.pop()?.setMap(null);
  }

  getPointsCount():number {
    return poly? poly.getPath().getLength():0;
  }
}
