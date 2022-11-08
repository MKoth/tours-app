import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PostsRoutingModule } from './posts-routing.module';
import { PostComponent } from './post/post.component';
import { FilterPostsComponent } from './filter-posts/filter-posts.component';
import { PostsListComponent } from './posts-list/posts-list.component';
import { UsefulComponentsModule } from '../useful-components/useful-components.module';
import { MaterialModule } from '../material/material.module';
import { EditPostComponent } from './edit-post/edit-post.component';
import { EditPostFormComponent } from './edit-post/edit-post-form/edit-post-form.component';
import { EditPostMapComponent } from './edit-post/edit-post-map/edit-post-map.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    PostComponent,
    FilterPostsComponent,
    PostsListComponent,
    EditPostComponent,
    EditPostFormComponent,
    EditPostMapComponent
  ],
  imports: [
    CommonModule,
    PostsRoutingModule,
    UsefulComponentsModule,
    MaterialModule,
    ReactiveFormsModule,
    FormsModule
  ]
})
export class PostsModule { }
