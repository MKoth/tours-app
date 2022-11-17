import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { FilterService, SearchParam } from 'src/app/filter.service';
import { Layer } from 'src/app/layers/layer.service';
import { Tag } from 'src/app/tags/tags.service';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';

@Component({
  selector: 'app-filter-tours',
  templateUrl: './filter-tours.component.html',
  styleUrls: ['./filter-tours.component.less']
})
export class FilterToursComponent implements OnInit {

  cities: City[] = [];
  search: string = '';
  filterForm: FormGroup;

  searchParams: SearchParam[] = [];
  fields: {name:string, operation:string}[] = [
    {name:'city', operation:':'},
    {name:'layer', operation:':'},
    {name:'tags', operation:':'},
  ];
  layer: Layer | {} = {};
  tags: Tag[] = [];

  constructor(
    private cityService: CityService,
    private activatedRoute: ActivatedRoute,
    private filterService: FilterService,
    private fb: FormBuilder
  ) {
    this.filterForm = this.fb.group({
      city: []
    });
  }

  setTags(tags:Tag[]) {
    this.tags = tags;
  }

  setLayer(layer: Layer | {}) {
    this.layer = layer;
  }

  ngOnInit(): void {
    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search) {
        this.search = search;
        this.searchParams = [];
        this.tags = [];
        this.layer = {};
        this.filterService.getValuesFromParam(search).subscribe({
          next: searchParam => {
            if (searchParam.name == "tags") 
              this.tags.push(searchParam.value);
            else if (searchParam.name == "layer") {
              this.layer = searchParam.value;
            } else
              this.filterForm.get(searchParam.name)?.setValue(searchParam.value.id);
            this.searchParams.push(searchParam);
          }
        });
      } else {
        this.cityService.getAllCities().subscribe(res=>{
          this.cities = res;
        });
      }
    });
  }

  clearFilters() {
    this.tags = [];
    this.layer = {};
    this.filterForm.reset();
    this.filterService.navigateWithParams([], "tours");
  }

  filter() {
    this.searchParams = [];
    for (const [name, value] of Object.entries(this.filterForm.value)) {
      if (value) {
        this.searchParams.push(this.generateSearchParam(name, value));
      }
    }
    this.tags.forEach(tag=>{
      this.searchParams.push(this.generateSearchParam("tags", tag));
    });
    if (this.layer && (this.layer as Layer).id){
      this.searchParams.push(this.generateSearchParam("layer", this.layer));
    }
    this.filterService.navigateWithParams(this.searchParams, "tours");
  }

  generateSearchParam(name: string, value:any):SearchParam {
    let searchParam: SearchParam = {name, operation: this.fields.find(field=>field.name==name)?.operation as string};
    if (name == "city") {
      searchParam.value = this.cities.find(city=>city.id==value);
    } else {
      searchParam.value = value;
    }
    return searchParam;
  }

}
