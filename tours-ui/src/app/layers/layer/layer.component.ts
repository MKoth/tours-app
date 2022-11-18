import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { Tour, TourService } from 'src/app/tours/tour.service';
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
  tours:Array<Tour> = [];
  isLoading:boolean = false;
  isError:boolean = false;
  excerptLength = 300;

  constructor(
    private layerService: LayerService,
    private tourService: TourService,
    private route: ActivatedRoute,
    private authService: AuthService
  ) { }

  canUserEditItem(creator_id: string) {
    return this.authService.canUserEditItem(creator_id);
  }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.isLoading = true;
    this.layerService.getLayerById(parseInt(id as string)).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.layer = result;
        this.initMap();
        this.tourService.findTour("layer:"+id).subscribe(tours=>{
          this.tours = tours;
        })
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
