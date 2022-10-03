import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewCityCreationDialogComponent } from './new-city-creation-dialog/new-city-creation-dialog.component';
import { MaterialModule } from '../material/material.module';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    NewCityCreationDialogComponent
  ],
  imports: [
    CommonModule,
    MaterialModule,
    FormsModule
  ],
  exports: [
    NewCityCreationDialogComponent
  ]
})
export class DialogsModule { }
