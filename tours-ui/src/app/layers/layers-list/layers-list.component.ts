import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-layers-list',
  templateUrl: './layers-list.component.html',
  styleUrls: ['./layers-list.component.less']
})
export class LayersListComponent implements OnInit {

  layers:Array<number> = [0,1,2,3,4,5,6,7,8,9,10,11];

  constructor() { }

  ngOnInit(): void {
  }

}
