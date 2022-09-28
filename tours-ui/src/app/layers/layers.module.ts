import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayersRoutingModule } from './layers-routing.module';
import { LayerComponent } from './layer/layer.component';
import { FilterLayersComponent } from './filter-layers/filter-layers.component';
import { LayersListComponent } from './layers-list/layers-list.component';


@NgModule({
  declarations: [
    LayerComponent,
    FilterLayersComponent,
    LayersListComponent
  ],
  imports: [
    CommonModule,
    LayersRoutingModule
  ]
})
export class LayersModule { }
