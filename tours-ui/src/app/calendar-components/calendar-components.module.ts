import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CalendarModule, DateAdapter } from 'angular-calendar';
import { adapterFactory } from 'angular-calendar/date-adapters/date-fns';
import { ToursAvaliabilityCalendarComponent } from './tours-avaliability-calendar/tours-avaliability-calendar.component';


@NgModule({
  declarations: [
    ToursAvaliabilityCalendarComponent
  ],
  imports: [
    CommonModule,
    CalendarModule.forRoot({ provide: DateAdapter, useFactory: adapterFactory }),
  ],
  exports: [
    ToursAvaliabilityCalendarComponent
  ]
})
export class CalendarComponentsModule { }
