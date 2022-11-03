import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Layer, LayerService } from 'src/app/layers/layer.service';

@Component({
  selector: 'app-select-layers-list',
  templateUrl: './select-layers-list.component.html',
  styleUrls: ['./select-layers-list.component.less']
})
export class SelectLayersListComponent implements OnInit {

  @Output() changeLayers = new EventEmitter<any>();
  @Input() value: string = '';
  @Input() cityId: number = 0;

  layers = new FormControl();
  allLayersList: Layer[] = [];
  layersList: Layer[] = this.allLayersList;

  constructor(private layerService: LayerService) { }

  ngOnInit(): void {
    this.layerService.findLayer("city:"+this.cityId).subscribe(result=>{
      this.allLayersList = result;
    });
  }

  onChange() {
    this.changeLayers.emit(this.layers.value());
  }

  onKey() {
    this.layersList = this.allLayersList.filter(option => option.name.toLowerCase().includes(this.value.toLowerCase()));
  }

  clearSearch() {
    this.layersList = this.allLayersList;
    this.value = "";
  }
}
