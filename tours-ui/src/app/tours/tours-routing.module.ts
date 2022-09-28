import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { TourComponent } from './tour/tour.component';
import { ToursListComponent } from './tours-list/tours-list.component';

const routes: Routes = [
  { path: '',  component: ToursListComponent },
  { path: ':id', component: TourComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ToursRoutingModule { }
