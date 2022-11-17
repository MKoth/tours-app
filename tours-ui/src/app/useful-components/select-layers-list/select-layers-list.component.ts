import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Layer, LayerService } from 'src/app/layers/layer.service';
import { City } from '../select-create-city/city.service';

@Component({
  selector: 'app-select-layers-list',
  templateUrl: './select-layers-list.component.html',
  styleUrls: ['./select-layers-list.component.less']
})
export class SelectLayersListComponent implements OnInit, OnChanges {

  @Output() changeLayers = new EventEmitter<Layer|{}>();
  @Input() layer: Layer | {} = {};

  layerId = new FormControl();
  allLayersList: Layer[] = [];
  layersList: Layer[] = this.allLayersList;
  value: string = '';

  constructor(private layerService: LayerService) { }

  ngOnChanges(): void {
    this.layerId.setValue((this.layer as Layer).id);
  }

  ngOnInit(): void {
    this.layerService.getAllLayers().subscribe(result=>{
      this.allLayersList = result;
      this.layersList = this.allLayersList;
      if (this.layer && (this.layer as Layer).id)
        this.layerId.setValue((this.layer as Layer).id);
    });
  }

  onChange() {
    this.changeLayers.emit(this.allLayersList.find(layer => layer.id == this.layerId.value));
  }

  onKey() {
    this.layersList = this.allLayersList.filter(option => option.name.toLowerCase().includes(this.value.toLowerCase()));
  }

  clearSearch() {
    this.layersList = this.allLayersList;
    this.value = "";
  }
}
