import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayersRoutingModule } from './layers-routing.module';
import { LayerComponent } from './layer/layer.component';
import { FilterLayersComponent } from './filter-layers/filter-layers.component';
import { LayersListComponent } from './layers-list/layers-list.component';
import { MaterialModule } from '../material/material.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EditLayerComponent } from './edit-layer/edit-layer.component';
import { EditLayerMapComponent } from './edit-layer/edit-layer-map/edit-layer-map.component';
import { EditLayerFormComponent } from './edit-layer/edit-layer-form/edit-layer-form.component';
import { UsefulComponentsModule } from '../useful-components/useful-components.module';

@NgModule({
  declarations: [
    LayerComponent,
    FilterLayersComponent,
    LayersListComponent,
    EditLayerComponent,
    EditLayerMapComponent,
    EditLayerFormComponent
  ],
  imports: [
    CommonModule,
    LayersRoutingModule,
    MaterialModule,
    FlexLayoutModule,
    ReactiveFormsModule,
    UsefulComponentsModule,
    FormsModule
  ]
})
export class LayersModule { }
