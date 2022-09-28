import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TagsRoutingModule } from './tags-routing.module';
import { FilterTagsComponent } from './filter-tags/filter-tags.component';
import { TagsListComponent } from './tags-list/tags-list.component';


@NgModule({
  declarations: [
    FilterTagsComponent,
    TagsListComponent
  ],
  imports: [
    CommonModule,
    TagsRoutingModule
  ]
})
export class TagsModule { }
