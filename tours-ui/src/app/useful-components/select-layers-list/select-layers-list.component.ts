import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-select-layers-list',
  templateUrl: './select-layers-list.component.html',
  styleUrls: ['./select-layers-list.component.less']
})
export class SelectLayersListComponent implements OnInit {
  layers = new FormControl('');
  allLayersList: string[] = ['Old City', '18th century', 'Jews Quarter', 'Riverside Area'];
  layersList: string[] = this.allLayersList;
  value: string = '';

  constructor() { }

  ngOnInit(): void {
  }

  onKey() {
    this.layersList = this.allLayersList.filter(option => option.toLowerCase().includes(this.value.toLowerCase()));
  }

  clearSearch() {
    this.layersList = this.allLayersList;
    this.value = "";
  }
}
