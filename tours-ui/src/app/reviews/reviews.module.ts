import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReviewComponent } from './review/review.component';
import { ReviewsListComponent } from './reviews-list/reviews-list.component';



@NgModule({
  declarations: [
    ReviewComponent,
    ReviewsListComponent
  ],
  imports: [
    CommonModule
  ]
})
export class ReviewsModule { }
