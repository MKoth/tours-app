import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { AppointmentComponent } from './appointment/appointment.component';
import { AppointmentsListComponent } from './appointments-list/appointments-list.component';
import { ScheduleComponent } from './schedule/schedule.component';

const routes: Routes = [
  { path: 'new',  component: ScheduleComponent },
  { path: 'appointments/:user_id',  component: AppointmentsListComponent, canActivate: [AuthGuard] },
  { path: 'appointment/:id',  component: AppointmentComponent, canActivate: [AuthGuard] },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ScheduleRoutingModule { }
