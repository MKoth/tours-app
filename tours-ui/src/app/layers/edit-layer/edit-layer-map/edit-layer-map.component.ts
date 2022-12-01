import { Component, Input, OnInit } from '@angular/core';
import { __values } from 'tslib';
import { Layer } from '../../layer.service';

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

  @Input() layer:Layer|{points:string[]} = {points:[]};
  defaultLatLng = ["49.83766974226121","24.034463539353638"];

  constructor() { }

  ngOnInit(): void {
    const startPoint = this.layer?.points.length?this.layer?.points[1].split(","):this.defaultLatLng;
    let mapProp = {
      center: new google.maps.LatLng(parseFloat(startPoint[0]),parseFloat(startPoint[1])),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapNewLayers") as HTMLElement, mapProp);

    const pathArr = this.layer?.points.map(point=>{
      let pointArr = point.split(",");
      return new google.maps.LatLng(parseFloat(pointArr[0]), parseFloat(pointArr[1]));
    });
    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
      path: pathArr
    });
  
    poly.setMap(map);
    const bounds = new google.maps.LatLngBounds();
    pathArr?.forEach(latLng=>{
      bounds.extend(latLng);
    });
    map.fitBounds(bounds);
    map.setCenter(bounds.getCenter());
    
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

  get path() {
    const path = poly.getPath();
    return path.getArray().map(value=>value.lat()+","+value.lng());
  }
}
