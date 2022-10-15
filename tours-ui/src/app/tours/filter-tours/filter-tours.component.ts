import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-filter-tours',
  templateUrl: './filter-tours.component.html',
  styleUrls: ['./filter-tours.component.less']
})
export class FilterToursComponent implements OnInit {

  city = 'lviv';

  constructor() { }

  ngOnInit(): void {
  }

}
