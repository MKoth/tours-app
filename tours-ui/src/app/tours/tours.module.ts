import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ToursRoutingModule } from './tours-routing.module';
import { TourComponent } from './tour/tour.component';
import { FilterToursComponent } from './filter-tours/filter-tours.component';
import { ToursListComponent } from './tours-list/tours-list.component';


@NgModule({
  declarations: [
    TourComponent,
    FilterToursComponent,
    ToursListComponent
  ],
  imports: [
    CommonModule,
    ToursRoutingModule
  ]
})
export class ToursModule { }
