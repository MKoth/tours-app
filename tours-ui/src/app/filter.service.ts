import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";
import { Observable, of, Subscriber } from 'rxjs';
import { LayerService } from './layers/layer.service';
import { TagsService } from './tags/tags.service';
import { TourService } from './tours/tour.service';
import { CityService } from './useful-components/select-create-city/city.service';

export interface SearchParam {
  name: string,
  operation: string,
  value?: any
}

@Injectable({
  providedIn: 'root'
})
export class FilterService {

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private cityService: CityService,
    private layerService: LayerService,
    private tourService: TourService,
    private tagsService: TagsService) {}

  getValuesFromParam(search: string):Observable<SearchParam> {
    const values:SearchParam[] = [];
    if(!search) return of();
    const searchMatch = /(\w+?)([:<>])(-?[\w\|]+?),/g;
    let execResult;

    const subscriprionFunctioon = (subscriber: Subscriber<any>, searchParam: SearchParam) => {
      return {
        next: (res: any)=>{
          searchParam.value = res;
          subscriber.next(searchParam);
        },
        error: (err: any)=>{subscriber.error(err)}
      }
    }
    return new Observable<SearchParam>(sub => {
      while(execResult = searchMatch.exec(search+",")) {
        const name = execResult[1];
        const operation = execResult[2];
        const value = execResult[3];
        const searchParam: SearchParam = {name: name, operation: operation}
        if (name=="tags") {
          this.tagsService.geTagById(parseInt(value)).subscribe(subscriprionFunctioon(sub, searchParam));
        } else if (name=="layer") {
          this.layerService.getLayerById(parseInt(value)).subscribe(subscriprionFunctioon(sub, searchParam));
        } else if (name=="tour") {
          this.tourService.getTourById(parseInt(value)).subscribe(subscriprionFunctioon(sub, searchParam));
        } else if (name=="city") {
          this.cityService.getCityById(parseInt(value)).subscribe(subscriprionFunctioon(sub, searchParam));
        } else if (name=="period_start" || name=="period_end") {
          const date = new Date(parseInt(value));
          searchParam.value = date.getUTCFullYear();
          sub.next(searchParam);
        }
      }
    });
  }

  navigateWithParams(params:SearchParam[], path: string) {
    let search:string[] = [];
    params.forEach(param => {
      if (param.name=="tags" || param.name=="city" || param.name=="layer" || param.name=="tour"){ 
        search.push(param.name + param.operation + param.value["id"]);
      } else if (param.name=="period_start" || param.name=="period_end") {
        const date = new Date();
        date.setUTCFullYear(param.value);
        date.setUTCMonth(0);
        date.setUTCDate(1);
        search.push(param.name + param.operation + date.getTime());
      }
    });
    this.router.navigate([path], {relativeTo: this.route, queryParams:{search:search.join(",")}})
  }
}
