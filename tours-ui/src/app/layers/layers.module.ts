import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayersRoutingModule } from './layers-routing.module';
import { LayerComponent } from './layer/layer.component';
import { FilterLayersComponent } from './filter-layers/filter-layers.component';
import { LayersListComponent } from './layers-list/layers-list.component';
import { MaterialModule } from '../material/material.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ReactiveFormsModule } from '@angular/forms';

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
    FlexLayoutModule,
    ReactiveFormsModule
  ]
})
export class LayersModule { }
