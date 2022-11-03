import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Layer, LayerService } from '../layer.service';

@Component({
  selector: 'app-layers-list',
  templateUrl: './layers-list.component.html',
  styleUrls: ['./layers-list.component.less']
})
export class LayersListComponent implements OnInit {

  layers:Array<Layer> = [];
  search = "";
  excerptLength = 300;

  constructor(
    private layerService: LayerService,
    private activatedRoute: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.layerService.getAllLayers().subscribe(result=>{
      this.layers = result;
    });
    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search !== this.search) {
        this.search = search;
        this.layerService.findLayer(search).subscribe(result=>{
          this.layers = result;
        });
      }
    });
  }

  getDateRange(layer: Layer) {
    let from = new Date(layer.period_start);
    let to = new Date(layer.period_end);
    return from.getFullYear + "-" + to.getFullYear;
  }

  turnicateText(text: string) {
    return text.substring(0, this.excerptLength)+"...";
  }

}
