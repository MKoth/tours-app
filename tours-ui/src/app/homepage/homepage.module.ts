import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HomepageRoutingModule } from './homepage-routing.module';
import { HomepageComponent } from './homepage/homepage.component';
import { GoogleMapsModule } from '@angular/google-maps';
import { MaterialModule } from '../material/material.module';
import { FormsModule } from '@angular/forms';
import { SideInfoBarComponent } from './side-info-bar/side-info-bar.component';
import { UsefulComponentsModule } from '../useful-components/useful-components.module';


@NgModule({
  declarations: [
    HomepageComponent,
    SideInfoBarComponent
  ],
  imports: [
    CommonModule,
    HomepageRoutingModule,
    GoogleMapsModule,
    MaterialModule,
    FormsModule,
    UsefulComponentsModule
  ]
})
export class HomepageModule { }
