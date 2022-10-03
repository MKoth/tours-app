import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

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

  constructor(
    public dialogRef: MatDialogRef<NewCityCreationDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
  ) {}

  onCancelClick(): void {
    this.dialogRef.close();
  }

  ngOnInit(): void {
    let mapProp = {
      center: new google.maps.LatLng(41.879, -87.624),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    marker = new google.maps.Marker({
      label: ""
    });
    map = new google.maps.Map(document.getElementById("newCityLocationSelectionMap") as HTMLElement, mapProp);
    google.maps.event.addListener(map, "click", (event: google.maps.MapMouseEvent) => {
      this.addMarker(event.latLng!, map);
    });
  }

  addMarker(location: google.maps.LatLng, map: google.maps.Map) {
    marker.setPosition(location);
    marker.setMap(map);
    this.data.location.lat = location.lat();
    this.data.location.lng = location.lng();
  }

}
