import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-find-tour-by-name',
  templateUrl: './find-tour-by-name.component.html',
  styleUrls: ['./find-tour-by-name.component.less']
})
export class FindTourByNameComponent implements OnInit {
  tour = new FormControl('');
  allToursList: string[] = ['Medieval Tour', '18th century Tour', 'History of Jews', 'River Secrets'];
  toursList: string[] = this.allToursList;
  value: string = '';

  constructor() { }

  ngOnInit(): void {
  }

  onKey() {
    this.toursList = this.allToursList.filter(option => option.toLowerCase().includes(this.value.toLowerCase()));
  }

  clearSearch() {
    this.toursList = this.allToursList;
    this.value = "";
  }

}
