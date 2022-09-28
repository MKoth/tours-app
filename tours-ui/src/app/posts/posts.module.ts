import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PostsRoutingModule } from './posts-routing.module';
import { PostComponent } from './post/post.component';
import { FilterPostsComponent } from './filter-posts/filter-posts.component';
import { PostsListComponent } from './posts-list/posts-list.component';


@NgModule({
  declarations: [
    PostComponent,
    FilterPostsComponent,
    PostsListComponent
  ],
  imports: [
    CommonModule,
    PostsRoutingModule
  ]
})
export class PostsModule { }
