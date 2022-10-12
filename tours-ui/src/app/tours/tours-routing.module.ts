import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { EditToursComponent } from './edit-tours/edit-tours.component';
import { TourComponent } from './tour/tour.component';
import { ToursListComponent } from './tours-list/tours-list.component';

const routes: Routes = [
  { path: '',  component: ToursListComponent },
  { path: 'edit/:id', component: EditToursComponent, canActivate: [AuthGuard] },
  { path: ':id', component: TourComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ToursRoutingModule { }
