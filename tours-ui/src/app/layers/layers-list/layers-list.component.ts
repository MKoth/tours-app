import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
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
    private activatedRoute: ActivatedRoute,
    private authService: AuthService
  ) { }

  canUserCreateItem() {
    return this.authService.canUserCreateItem();
  }

  ngOnInit(): void {
    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search && search !== this.search) {
        this.search = search;
        this.layerService.findLayer(search).subscribe(result=>{
          this.layers = result;
        });
      } else {
        this.layerService.getAllLayers().subscribe(result=>{
          this.layers = result;
        });
      }
    });
  }

  getDateRange(layer: Layer) {
    let from = new Date(layer.period_start);
    let to = new Date(layer.period_end);
    return from.getFullYear() + " year - " + to.getFullYear()+" year";
  }

  turnicateText(text: string) {
    const regexp = /(<([^>]+)>)/gi;
    const strippedText = text.replace(regexp, "");
    return strippedText.substring(0, this.excerptLength)+"...";
  }

}
