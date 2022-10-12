import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewCityCreationDialogComponent } from './new-city-creation-dialog/new-city-creation-dialog.component';
import { MaterialModule } from '../material/material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToursAvailabilityDialogComponent } from './tours-availability-dialog/tours-availability-dialog.component';
import { FlexModule } from '@angular/flex-layout';
import { NgxMatDatetimePickerModule, NgxMatTimepickerModule } from '@angular-material-components/datetime-picker';


@NgModule({
  declarations: [
    NewCityCreationDialogComponent,
    ToursAvailabilityDialogComponent
  ],
  imports: [
    FlexModule,
    CommonModule,
    MaterialModule,
    FormsModule,
    NgxMatTimepickerModule,
    ReactiveFormsModule,
    NgxMatDatetimePickerModule,
  ],
  exports: [
    NewCityCreationDialogComponent
  ]
})
export class DialogsModule { }
