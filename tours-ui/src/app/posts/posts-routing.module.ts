import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { PostComponent } from './post/post.component';
import { PostsListComponent } from './posts-list/posts-list.component';

const routes: Routes = [
  { path: '',  component: PostsListComponent },
  { path: ':id', component: PostComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PostsRoutingModule { }
