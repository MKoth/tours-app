import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Route, Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent implements OnInit{
  title = 'tours-ui';
  path: string = '';
  constructor(private router:Router) {}
  
  ngOnInit(): void {
    this.router.events.subscribe(res=>{
      if (res instanceof NavigationEnd) {
        console.log(res);
        this.path = res.urlAfterRedirects;
      }
    });
  }


}
