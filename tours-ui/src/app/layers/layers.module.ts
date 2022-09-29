import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayersRoutingModule } from './layers-routing.module';
import { LayerComponent } from './layer/layer.component';
import { FilterLayersComponent } from './filter-layers/filter-layers.component';
import { LayersListComponent } from './layers-list/layers-list.component';
import { MaterialModule } from '../material/material.module';
import { BrowserModule } from '@angular/platform-browser';
import { FlexLayoutModule } from '@angular/flex-layout';


@NgModule({
  declarations: [
    LayerComponent,
    FilterLayersComponent,
    LayersListComponent
  ],
  imports: [
    CommonModule,
    LayersRoutingModule,
    MaterialModule,
    FlexLayoutModule
  ]
})
export class LayersModule { }
