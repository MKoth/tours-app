import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-posts-list',
  templateUrl: './posts-list.component.html',
  styleUrls: ['./posts-list.component.less']
})
export class PostsListComponent implements OnInit {

  posts:Array<number> = [0,1,2,3,4,5,6,7,8,9,10,11];

  constructor() { }

  ngOnInit(): void {
  }

}
