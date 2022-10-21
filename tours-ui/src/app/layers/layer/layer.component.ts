import { Component, OnInit } from '@angular/core';

let map:google.maps.Map;

@Component({
  selector: 'app-layer',
  templateUrl: './layer.component.html',
  styleUrls: ['./layer.component.less']
})

export class LayerComponent implements OnInit {


  tours:Array<number> = [0,1,2];

  constructor() { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapLayer") as HTMLElement, mapProp);
  }

}
