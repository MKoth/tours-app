import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { FilterService, SearchParam } from 'src/app/filter.service';
import { City, CityService } from 'src/app/useful-components/select-create-city/city.service';

@Component({
  selector: 'app-filter-posts',
  templateUrl: './filter-posts.component.html',
  styleUrls: ['./filter-posts.component.less']
})
export class FilterPostsComponent implements OnInit {

  cities: City[] = [];
  search: string = '';
  filterForm: FormGroup;

  searchParams: SearchParam[] = [];
  fields: {name:string, operation:string}[] = [
    {name:'city', operation:':'},
    {name:'layer', operation:':'},
    {name:'tags', operation:':'},
  ];

  constructor(
    private cityService: CityService,
    private activatedRoute: ActivatedRoute,
    private filterService: FilterService,
    private fb: FormBuilder
  ) {
    this.filterForm = this.fb.group({
      city: [],
      layer: [],
      tags: [[]]
    });
  }

  setTags(tags:[]) {
    this.filterForm.get("tags")?.setValue(tags);
  }

  setLayer(layerId: number) {
    this.filterForm.get("layer")?.setValue(layerId);
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
      let formField = this.filterForm.get(field.name);
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
      if (field = this.filterForm.get(param.name)) {
        field.setValue(param.values? param.values : param.value);
      }
    });
  }

  getTourId() {
    let tourField = this.searchParams.find(param=>param.name=="tour");
    if (tourField)
      return parseInt(tourField.value as string);
    return 0;
  }

  onTourChange(tourId: any) {
    this.filterService.navigateWithParams([
      {name: "tour", operation:":", value: tourId},
      {name: "city", operation:":", value: this.filterForm.get("layer")?.value}
    ]);
  }

}
