import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { FormControl } from '@angular/forms';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';
import { Observable, startWith, map } from 'rxjs';
import { MatChipInputEvent } from '@angular/material/chips';

@Component({
  selector: 'app-filter-layers',
  templateUrl: './filter-layers.component.html',
  styleUrls: ['./filter-layers.component.less']
})
export class FilterLayersComponent implements OnInit {

  city = 'lviv';
  century = 'xix';

  constructor() {
  }

  ngOnInit(): void {
  }
}
