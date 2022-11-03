import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { NewCityCreationDialogComponent } from 'src/app/dialogs/new-city-creation-dialog/new-city-creation-dialog.component';
import { City, CityService } from './city.service';

@Component({
  selector: 'app-select-create-city',
  templateUrl: './select-create-city.component.html',
  styleUrls: ['./select-create-city.component.less']
})
export class SelectCreateCityComponent implements OnInit {

  @Output() onCityChange = new EventEmitter<City>();
  @Input() city: number|null = null;

  cities: Array<City> = [];
  selectedCity = new FormControl();

  constructor(
    public dialog: MatDialog,
    private cityService: CityService
  ) { }

  ngOnInit(): void {
    if (this.city) this.selectedCity.setValue(this.city);
    this.cityService.getAllCities().subscribe(cities => {
      if (this.cities.length)
        this.cities = cities;
      else
        this.cities = [{id:-1, name:"No city available, create one!", point:""}];
    });
  }

  onChange() {
    this.onCityChange.emit(this.cities.find(city=>this.selectedCity.value()==city.id));
  }

  openDialog(event: MouseEvent): void {
    event.stopPropagation();
    event.preventDefault();
    const dialogRef = this.dialog.open(NewCityCreationDialogComponent, {
      width: '600px'
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) this.cities.push(result);
    });
  }

}
