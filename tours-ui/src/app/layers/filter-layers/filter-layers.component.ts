import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';
import { ActivatedRoute } from '@angular/router';
import { FilterService, SearchParam } from 'src/app/filter.service';
import { Tag } from 'src/app/tags/tags.service';

@Component({
  selector: 'app-filter-layers',
  templateUrl: './filter-layers.component.html',
  styleUrls: ['./filter-layers.component.less']
})
export class FilterLayersComponent implements OnInit {

  cities: City[] = [];
  search: string = '';
  filterForm: FormGroup;

  searchParams: SearchParam[] = [];
  fields: {name:string, operation:string}[] = [
    {name:'city', operation:':'},
    {name:'period_start', operation:'>'},
    {name:'period_end', operation:'<'},
    {name:'tags', operation:':'},
  ];
  tags: Tag[] = [];

  constructor(
    private cityService: CityService,
    private activatedRoute: ActivatedRoute,
    private filterService: FilterService,
    private fb: FormBuilder
  ) {
    this.filterForm = this.fb.group({
      city: [],
      period_start: [],
      period_end: []
    });
  }

  setTags(tags:Tag[]) {
    this.tags = tags;
  }

  ngOnInit(): void {
    this.cityService.getAllCities().subscribe(res=>{
      this.cities = res;
    });

    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      console.log("search", search);
      if(search !== this.search) {
        this.search = search;
        this.searchParams = [];
        this.tags = [];
        this.filterService.getValuesFromParam(search).subscribe({
          next: searchParam => {
            if (searchParam.name == "tags") 
              this.tags.push(searchParam.value);
            else if (searchParam.name == "period_start"||searchParam.name == "period_end") {
              this.filterForm.get(searchParam.name)?.setValue(searchParam.value);
            } else
              this.filterForm.get(searchParam.name)?.setValue(searchParam.value.id);
            this.searchParams.push(searchParam);
          }
        });
      }
    });
  }

  clearFilters() {
    this.filterForm.reset();
    this.filterService.navigateWithParams([]);
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
    this.filterService.navigateWithParams(this.searchParams);
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
