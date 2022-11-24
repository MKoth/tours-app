import { Component, EventEmitter, Input, OnInit, Output, SimpleChanges } from '@angular/core';
import { Layer } from 'src/app/layers/layer.service';
import { Post, PostService } from 'src/app/posts/post.service';
import { Tag } from 'src/app/tags/tags.service';
import { Tour } from 'src/app/tours/tour.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';

@Component({
  selector: 'app-side-info-bar',
  templateUrl: './side-info-bar.component.html',
  styleUrls: ['./side-info-bar.component.less']
})
export class SideInfoBarComponent implements OnInit {
  @Input() postId: number = 0;
  @Input() posts: Post[] = [];
  @Output() onPostChange = new EventEmitter();
  @Output() onSideInfoClose = new EventEmitter();
  
  shownItem: Layer | Tour | Post | null = null;
  post: Post | null = null;
  isLoading = false;
  isError = false;
  view: string = "post";
  prevPostId: number = 0;
  nextPostId: number = 0;

  constructor(
    private postService: PostService
  ) {
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['postId']) {
        this.fetchById(changes['postId'].currentValue);
    }
  }

  ngOnInit(): void {
    this.fetchById(this.postId);
  }

  closeSideInfo() {
    this.onSideInfoClose.emit();
  }

  goToPost(nextPostId: number) {
    this.onPostChange.emit(nextPostId);
  }

  goToTourFromPost() {
    this.view = "tour";
    this.shownItem = this.post!.tour as Tour;
  }

  goToLayerFromPost() {
    this.view = "layer";
    this.shownItem = this.post!.layer as Layer;
  }

  goBackToPost() {
    this.view = "post";
    this.shownItem = this.post as Post;
  }

  fetchById(postId: number) {
    this.view = "post";
    const postIndex = this.posts.findIndex(p=>p.id==postId);
    this.shownItem = this.post = this.posts[postIndex];
    this.prevPostId = postIndex!==0? this.posts[postIndex-1].id as number : 0;
    this.nextPostId = postIndex!==this.posts.length-1? this.posts[postIndex+1].id as number : 0;
  }

  getDateRange(item: Post | Layer) {
    let from = new Date(item.period_start);
    let to = new Date(item.period_end);
    return from.toDateString() + " - " + to.toDateString();
  }

  getDuration(minutes: number) {
    const h = Math.floor(minutes / 60);
    const m = minutes % 60;
    return h+"h "+m+"min";
  }

}
