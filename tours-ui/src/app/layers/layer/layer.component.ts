import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TourService } from 'src/app/tours/tour.service';
import { Layer, LayerService } from '../layer.service';

let map:google.maps.Map;
let poly:google.maps.Polyline;

@Component({
  selector: 'app-layer',
  templateUrl: './layer.component.html',
  styleUrls: ['./layer.component.less']
})

export class LayerComponent implements OnInit {
  layerId: number = 0;
  layer: Layer | null = null;
  tours:Array<number> = [];
  isLoading:boolean = false;
  isError:boolean = false;
  excerptLength = 300;

  constructor(
    private layerService: LayerService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.isLoading = true;
    this.layerService.getLayerById(parseInt(id as string)).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.layer = result;
        this.initMap();
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
    
  }

  initMap() {
    let cityLatLng = this.layer?.city.point.split(",").map(coord=>parseFloat(coord));
    let mapProp = {
      center: new google.maps.LatLng((cityLatLng as number[])[0], (cityLatLng as number[])[1]),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapLayer") as HTMLElement, mapProp);
    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
      path:this.layer?.points.map(point=>{
        let pointArr = point.split(",");
        return new google.maps.LatLng(parseFloat(pointArr[0]), parseFloat(pointArr[1]));
      })
    });
  
    poly.setMap(map);
  }

  getDateRange(layer: Layer) {
    let from = new Date(layer.period_start);
    let to = new Date(layer.period_end);
    return from.toDateString() + " - " + to.toDateString();
  }

  getDuration(minutes: number) {
    const h = Math.floor(minutes / 60);
    const m = minutes % 60;
    return h+"h "+m+"min";
  }

  turnicateText(text: string) {
    const regexp = /(<([^>]+)>)/gi;
    const strippedText = text.replace(regexp, "");
    return strippedText.substring(0, this.excerptLength)+"...";
  }

}
