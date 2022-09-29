import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HomepageRoutingModule } from './homepage-routing.module';
import { HomepageComponent } from './homepage/homepage.component';
import { GoogleMapsModule } from '@angular/google-maps';
import { MaterialModule } from '../material/material.module';


@NgModule({
  declarations: [
    HomepageComponent
  ],
  imports: [
    CommonModule,
    HomepageRoutingModule,
    GoogleMapsModule,
    MaterialModule
  ]
})
export class HomepageModule { }