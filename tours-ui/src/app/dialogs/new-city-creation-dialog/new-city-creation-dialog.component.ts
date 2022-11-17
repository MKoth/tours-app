import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';

let map:google.maps.Map;
let marker:google.maps.Marker;

export interface DialogData {
  city: string;
  location: {
    lat: number,
    lng: number
  };
}

@Component({
  selector: 'app-new-city-creation-dialog',
  templateUrl: './new-city-creation-dialog.component.html',
  styleUrls: ['./new-city-creation-dialog.component.less']
})
export class NewCityCreationDialogComponent implements OnInit {

  errorMessage = "";
  isLoading: boolean = false;

  city: City = {
    id: 0,
    name: "",
    point: ""
  };

  constructor(
    public dialogRef: MatDialogRef<NewCityCreationDialogComponent>,
    private cityService: CityService
  ) {}

  onCancelClick(): void {
    this.dialogRef.close();
  }

  addNewCity() {
    if (!this.city.name || !this.city.point){
      this.errorMessage = "City should have name and location";
      return;
    }
    this.isLoading = true;
    this.cityService.createCity(this.city).subscribe({
      error: err => {
        console.log("Error happened", err);
        this.isLoading = false;
        this.errorMessage = "Error happened while saving new city, please try again later!";
      },
      next: newCity => {
        this.dialogRef.close(newCity);
      }
    });
  }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    marker = new google.maps.Marker({
      label: ""
    });
    map = new google.maps.Map(document.getElementById("newCityLocationSelectionMap") as HTMLElement, mapProp);
    google.maps.event.addListener(map, "click", (event: google.maps.MapMouseEvent) => {
      this.addMarker(event.latLng!);
    });
  }

  addMarker(location: google.maps.LatLng) {
    marker.setPosition(location);
    marker.setMap(map);
    this.city.point = location.lat() + "," + location.lng();
  }

}
