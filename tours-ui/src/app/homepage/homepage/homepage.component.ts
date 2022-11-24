import { Component, OnInit } from '@angular/core';
import { Layer, LayerService } from 'src/app/layers/layer.service';
import { Post } from 'src/app/posts/post.service';
import { Tour, TourService } from 'src/app/tours/tour.service';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';
import colorArray from "./colors";

let map:google.maps.Map;
let event:google.maps.MapsEventListener;

interface SelectableLayer {
  name:string,
  id:number,
  selected: boolean,
  color: string,
  poly: google.maps.Polyline,
  toursPolies: google.maps.Polyline[]
  toursMarkers: google.maps.Marker[]
}

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.less']
})
export class HomepageComponent implements OnInit {
  cities: City[] = [];
  layers: Layer[] = [];
  tours: Tour[] = [];
  selectedCityId: number = 0;
  selectDisselectAll: boolean = true;
  indeterminateSelection: boolean = false;
  selectableLayers: SelectableLayer[] = [];
  selectedPostId: number = 0;
  selectedToursPosts: Post[] = [];
  selectedMarker: google.maps.Marker | null = null;
  previousColor: string = '';
  markerPostMapper: {post_id:number, post_marker: google.maps.Marker}[] = [];

  constructor(
    private cityService: CityService,
    private layerService: LayerService,
    private tourService: TourService
  ) { }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(49.83766974226121,24.034463539353638),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMap") as HTMLElement, mapProp);

    this.cityService.getAllCities().subscribe(res=>{
      this.cities = res;
    });
  }

  clearMapsData() {
    this.selectableLayers.forEach(layer=>{
      layer.poly.getPath().clear();
      layer.poly.setMap(null);
      layer.toursPolies.forEach(poly=>{
        poly.getPath().clear();
        poly.setMap(null);
      });
      layer.toursMarkers.forEach(marker=>marker.setMap(null));
    });
    this.selectableLayers = [];
  }

  mapToursPolylineAndLocations(tours: Tour[]) {
    tours.forEach(tour=>{
      const color = this.getRandomColorPair();
      const poly = new google.maps.Polyline({
        strokeColor: color[0],
        strokeOpacity: 1.0,
        strokeWeight: 5,
        zIndex: 5
      });
      const markers:google.maps.Marker[] = [];
      tour.locations.forEach(post=>{
        const point = post.point.split(",").map(loc=>parseFloat(loc));
        const latLng = new google.maps.LatLng(point[0], point[1]);
        poly.getPath().push(latLng);
        const newMarker = new google.maps.Marker({
          label:"",
          icon: {
            path: google.maps.SymbolPath.CIRCLE,
            strokeColor: color[1],
            scale: 4
          },
          position: latLng,
        });
        newMarker.addListener("click", ()=>{
          this.onMarkerClick(post.id as number, tour.locations, newMarker);
        })
        markers.push(newMarker);

        this.markerPostMapper.push({post_id: post.id as number, post_marker: newMarker});
      });
      const relatedLayer = this.selectableLayers.find(layer=>layer.id==(tour.layer as Layer).id);
      relatedLayer!.toursPolies.push(poly);
      relatedLayer!.toursMarkers = markers;
    });
  }

  onMarkerClick(postId: number, posts: Post[], marker: google.maps.Marker) {
    this.clearPreviousMarker()
    this.selectedPostId = postId;
    this.selectedToursPosts = posts;
    this.selectedMarker = marker;
    this.highlightSelectedMarker();
  }

  displayedPostChanged(newPostId: number) {
    const newMarker = this.markerPostMapper.find(postMapper=>postMapper.post_id == newPostId)?.post_marker;
    this.onMarkerClick(newPostId, this.selectedToursPosts, newMarker as google.maps.Marker);
  }

  clearPreviousMarker() {
    if (this.selectedPostId) {
      const previousIcon = this.selectedMarker!.getIcon() as google.maps.Symbol;
      previousIcon.strokeColor = this.previousColor;
      previousIcon.scale = 4;
      this.selectedMarker!.setIcon(previousIcon);
    }
    this.selectedPostId = 0;
    this.selectedToursPosts = [];
    this.selectedMarker = null;
    this.previousColor = '';
  }

  highlightSelectedMarker() {
    const clickedIcon = this.selectedMarker!.getIcon() as google.maps.Symbol;
    this.previousColor = clickedIcon.strokeColor as string;
    clickedIcon.strokeColor = 'red';
    clickedIcon.scale = 6;
    this.selectedMarker!.setIcon(clickedIcon);
  }

  mapLayersPolyline(layers: Layer[]) {
    layers.forEach(layer => {
      const color = this.getRandomColorPair()[0];
      const poly = new google.maps.Polyline({
        strokeColor: color,
        strokeOpacity: 1.0,
        strokeWeight: 8,
        zIndex: 3
      });
      layer.points.forEach(point=>{
        const p = point.split(",").map(loc=>parseFloat(loc));
        const latLng = new google.maps.LatLng(p[0], p[1]);
        poly.getPath().push(latLng);
      });
      this.selectableLayers.push({
        id: layer.id as number,
        name: layer.name,
        selected: true,
        color: color,
        poly: poly,
        toursPolies: [],
        toursMarkers: []
      });
    });
  }

  onAllSelectionDisselection() {
    this.selectableLayers.forEach(layer=>{
      layer.selected = this.selectDisselectAll;
    });
    this.showSelectedLayersOnMap();
  }

  showSelectedLayersOnMap() {
    const bounds = new google.maps.LatLngBounds();
    let selectedCount = 0;
    this.selectableLayers.forEach(layer=>{
      if(layer.selected){
        layer.poly.setMap(map);
        layer.toursMarkers.forEach(marker=>marker.setMap(map));
        layer.toursPolies.forEach(poly=>poly.setMap(map));
        this.extendBounds(layer.poly, bounds);
        selectedCount++;
      } else {
        layer.poly.setMap(null);
        layer.toursMarkers.forEach(marker=>marker.setMap(null));
        layer.toursPolies.forEach(poly=>poly.setMap(null));
      }
    });
    this.indeterminateSelection = selectedCount > 0 && selectedCount < this.selectableLayers.length;
    if (!bounds.isEmpty()){
      map.fitBounds(bounds);
      map.setCenter(bounds.getCenter());
    }
  }

  extendBounds(poly: google.maps.Polyline,bounds: google.maps.LatLngBounds) {
    poly.getPath().forEach(latLng=>{
      bounds.extend(latLng);
    })
  }

  fetchInfo() {
    this.clearMapsData();
    this.layerService.findLayer("city:"+this.selectedCityId).subscribe(res=>{
      this.mapLayersPolyline(res);
      this.tourService.findTour("city:"+this.selectedCityId).subscribe(res=>{
        this.tours = res;
        this.mapToursPolylineAndLocations(res);
        this.showSelectedLayersOnMap();
      });
    });
  }

  getRandomColorPair() {
    const lighterColor = colorArray[Math.floor(Math.random()*colorArray.length)];
    const darkerColor = this.adjust(lighterColor, -40);
    return [lighterColor, darkerColor];
  }

  adjust(color: string, amount:number) {
    return '#' + color.replace(/^#/, '').replace(/../g, col => ('0'+Math.min(255, Math.max(0, parseInt(col, 16) + amount)).toString(16)).substr(-2));
  }

}
