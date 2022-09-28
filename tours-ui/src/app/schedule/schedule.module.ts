import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ScheduleRoutingModule } from './schedule-routing.module';
import { ScheduleComponent } from './schedule/schedule.component';
import { AppointmentComponent } from './appointment/appointment.component';
import { AppointmentsListComponent } from './appointments-list/appointments-list.component';


@NgModule({
  declarations: [
    ScheduleComponent,
    AppointmentComponent,
    AppointmentsListComponent
  ],
  imports: [
    CommonModule,
    ScheduleRoutingModule
  ]
})
export class ScheduleModule { }
