import { Component, OnInit } from '@angular/core';

let map:google.maps.Map;
let poly:google.maps.Polyline;
let event:google.maps.MapsEventListener;
let eventCleared:boolean = true;

@Component({
  selector: 'app-edit-layer-map',
  templateUrl: './edit-layer-map.component.html',
  styleUrls: ['./edit-layer-map.component.less']
})
export class EditLayerMapComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewLayers") as HTMLElement, mapProp);

    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
    });
  
    poly.setMap(map);
    this.assignEvent();
  }

  get eventCleared(): boolean {
    return eventCleared;
  }

  addLatLng(event:any) {
    console.log("called");
    const path = poly.getPath();

    // Because path is an MVCArray, we can simply append a new coordinate
    // and it will automatically appear.
    path.push(event.latLng);
  }

  assignEvent() {
    if(eventCleared){
      event = map.addListener("click", this.addLatLng);
      eventCleared = false;
    }
  }

  clearEvent() {
    event.remove();
    eventCleared = true;
  }

  cancelLastStroke() {
    if (eventCleared) return;
    const path = poly.getPath();
    path.pop();
  }

  clearPolyline() {
    const path = poly.getPath();
    path.clear();
    this.assignEvent();
  }

  closePolyline() {
    const path = poly.getPath();

    path.push(path.getAt(0));
    this.clearEvent();
  }

  getPointsCount():number {
    return poly? poly.getPath().getLength():0;
  }
}
