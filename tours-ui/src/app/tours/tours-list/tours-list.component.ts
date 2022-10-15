import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-tours-list',
  templateUrl: './tours-list.component.html',
  styleUrls: ['./tours-list.component.less']
})
export class ToursListComponent implements OnInit {

  tours:Array<number> = [0,1,2,3,4,5,6,7,8,9,10,11];

  constructor() { }

  ngOnInit(): void {
  }

}
