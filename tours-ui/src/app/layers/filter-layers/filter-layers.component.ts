import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';
import { ActivatedRoute } from '@angular/router';
import { FilterService, SearchParam } from 'src/app/filter.service';

@Component({
  selector: 'app-filter-layers',
  templateUrl: './filter-layers.component.html',
  styleUrls: ['./filter-layers.component.less']
})
export class FilterLayersComponent implements OnInit {


  city = 'lviv';
  cities: City[] = [];
  search: string = '';
  contactForm: FormGroup;

  searchParams: SearchParam[] = [];
  fields: {name:string, operation:string}[] = [
    {name:'city', operation:':'},
    {name:'period_start', operation:'>'},
    {name:'period_end', operation:'<'},
    {name:'tags', operation:':'},
  ];

  constructor(
    private cityService: CityService,
    private activatedRoute: ActivatedRoute,
    private filterService: FilterService,
    private fb: FormBuilder
  ) {
    this.contactForm = this.fb.group({
      city: [],
      period_start: [],
      period_end: [],
      tags: [[]]
    });
  }

  setTags(tags:[]) {
    this.contactForm.get("tags")?.setValue(tags);
  }

  ngOnInit(): void {
    this.cityService.getAllCities().subscribe(res=>{
      this.cities = res;
    });

    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search !== this.search) {
        this.search = search;
        this.searchParams = this.filterService.getValuesFromParam(search);
        this.setFieldsAccordingToParam();
      }
    });
  }

  clearFilters() {
    this.filterService.navigateWithParams([]);
  }

  filter() {
    this.fields.forEach(field => {
      let formField = this.contactForm.get(field.name);
      let searchParam = this.searchParams.find(param=>param.name==field.name);
      if (searchParam) {
        if(searchParam.name == "tags")
          searchParam.values = formField?.value;
        else
          searchParam.value = formField?.value;
      } else {
        const key = field.name == "tags"? "values":"value";
        this.searchParams.push({...field, [key]:formField?.value});
      }
    });
    this.filterService.navigateWithParams(this.searchParams);
  }

  setFieldsAccordingToParam() {
    this.searchParams.forEach(param => {
      let field;
      if (field = this.contactForm.get(param.name)) {
        field.setValue(param.values? param.values : param.value);
      }
    });
  }
}
