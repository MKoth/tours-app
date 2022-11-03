import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";

export interface SearchParam {
  name: string,
  operation: string,
  value?: string,
  values?: number[]
}

@Injectable({
  providedIn: 'root'
})
export class FilterService {

  constructor(private router: Router, private route: ActivatedRoute) {}

  getValuesFromParam(search: string) {
    const values:SearchParam[] = [];
    if(!search) return values;
    const searchMatch = /(\w+?)([:<>])([\w\|]+?),/g;
    let execResult;
    while(execResult = searchMatch.exec(search+",")) {
      if (execResult[1]=="tags") {
        values.push({
          name: execResult[1],
          operation: execResult[2],
          values: execResult[3].split("|").map(val=>parseInt(val))
        });
      } else {
        values.push({
          name: execResult[1],
          operation: execResult[2],
          value: execResult[3]
        });
      }
    }
    return values;
  }

  navigateWithParams(params:SearchParam[]) {
    let search:string[] = [];
    params.forEach(param => {
      if(param.name=="tags") {
        search.push(param.name + param.operation + param.values?.join("|"))
      } else {
        search.push(param.name + param.operation + param.value)
      }
    });
    this.router.navigate([''], {relativeTo: this.route, queryParams:{search:search.join(",")}})
  }
}
