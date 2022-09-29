import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { MaterialModule } from '../material/material.module';
import { LayerComponent } from './layer/layer.component';
import { LayersListComponent } from './layers-list/layers-list.component';

const routes: Routes = [
  { path: '',  component: LayersListComponent },
  { path: ':id', component: LayerComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class LayersRoutingModule { }
