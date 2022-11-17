import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Post, PostService } from '../post.service';

@Component({
  selector: 'app-posts-list',
  templateUrl: './posts-list.component.html',
  styleUrls: ['./posts-list.component.less']
})
export class PostsListComponent implements OnInit {

  posts:Array<Post> = [];
  search = "";
  excerptLength = 300;

  constructor(
    private postService: PostService,
    private activatedRoute: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search && search !== this.search) {
        this.search = search;
        this.postService.findPost(search).subscribe(result=>{
          this.posts = result;
        });
      } else {
        this.postService.getAllPosts().subscribe(result=>{
          this.posts = result;
        });
      }
    });
  }

  turnicateText(text: string) {
    const regexp = /(<([^>]+)>)/gi;
    const strippedText = text.replace(regexp, "");
    return strippedText.substring(0, this.excerptLength)+"...";
  }

}
