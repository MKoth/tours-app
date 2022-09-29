import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AuthGuard } from './auth/auth.guard';

const routes: Routes = [
  {
    path: 'profile',
    loadChildren: () => import('./profile/profile.module').then(m => m.ProfileModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'checkout',
    loadChildren: () => import('./checkout/checkout.module').then(m => m.CheckoutModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'schedule',
    loadChildren: () => import('./schedule/schedule.module').then(m => m.ScheduleModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'tours',
    loadChildren: () => import('./tours/tours.module').then(m => m.ToursModule),
    data: { preload: true }
  },
  {
    path: 'layers',
    loadChildren: () => import('./layers/layers.module').then(m => m.LayersModule),
    data: { preload: true }
  },
  {
    path: 'posts',
    loadChildren: () => import('./posts/posts.module').then(m => m.PostsModule),
    data: { preload: true }
  },
  {
    path: 'tags',
    loadChildren: () => import('./tags/tags.module').then(m => m.TagsModule),
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
