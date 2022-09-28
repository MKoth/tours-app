import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AuthGuard } from './auth/auth.guard';

const routes: Routes = [
  {
    path: 'profile',
    loadChildren: () => import('./profile/profile-routing.module').then(m => m.ProfileRoutingModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'checkout',
    loadChildren: () => import('./checkout/checkout-routing.module').then(m => m.CheckoutRoutingModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'schedule',
    loadChildren: () => import('./schedule/schedule-routing.module').then(m => m.ScheduleRoutingModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'tours',
    loadChildren: () => import('./tours/tours-routing.module').then(m => m.ToursRoutingModule),
    data: { preload: true }
  },
  {
    path: 'layers',
    loadChildren: () => import('./layers/layers-routing.module').then(m => m.LayersRoutingModule),
    data: { preload: true }
  },
  {
    path: 'posts',
    loadChildren: () => import('./posts/posts-routing.module').then(m => m.PostsRoutingModule),
    data: { preload: true }
  },
  {
    path: 'tags',
    loadChildren: () => import('./tags/tags-routing.module').then(m => m.TagsRoutingModule),
    data: { preload: true }
  },
  { path: '',   redirectTo: '/home', pathMatch: 'full' },
  { path: '**', component: PageNotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
