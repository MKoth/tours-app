import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ToursRoutingModule } from './tours-routing.module';
import { TourComponent } from './tour/tour.component';
import { FilterToursComponent } from './filter-tours/filter-tours.component';
import { ToursListComponent } from './tours-list/tours-list.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { EditToursComponent } from './edit-tours/edit-tours.component';
import { EditToursMapComponent } from './edit-tours/edit-tours-map/edit-tours-map.component';
import { EditToursFormComponent } from './edit-tours/edit-tours-form/edit-tours-form.component';
import { EditToursCalendarComponent } from './edit-tours/edit-tours-calendar/edit-tours-calendar.component';
import { UsefulComponentsModule } from '../useful-components/useful-components.module';
import { MaterialModule } from '../material/material.module';
import { CalendarModule, DateAdapter } from 'angular-calendar';
import { adapterFactory } from 'angular-calendar/date-adapters/date-fns';
import { CalendarComponentsModule } from '../calendar-components/calendar-components.module';

@NgModule({
  declarations: [
    TourComponent,
    FilterToursComponent,
    ToursListComponent,
    EditToursComponent,
    EditToursMapComponent,
    EditToursFormComponent,
    EditToursCalendarComponent
  ],
  imports: [
    CommonModule,
    ToursRoutingModule,
    UsefulComponentsModule,
    MaterialModule,
    CalendarComponentsModule
  ]
})
export class ToursModule { }
