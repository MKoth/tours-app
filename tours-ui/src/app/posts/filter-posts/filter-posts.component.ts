import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-filter-posts',
  templateUrl: './filter-posts.component.html',
  styleUrls: ['./filter-posts.component.less']
})
export class FilterPostsComponent implements OnInit {

  city = 'lviv';

  constructor() { }

  ngOnInit(): void {
  }

}
