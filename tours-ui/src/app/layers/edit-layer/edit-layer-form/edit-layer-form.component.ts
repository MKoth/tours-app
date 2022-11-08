import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Tag } from 'src/app/tags/tags.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Layer } from '../../layer.service';

@Component({
  selector: 'app-edit-layer-form',
  templateUrl: './edit-layer-form.component.html',
  styleUrls: ['./edit-layer-form.component.less']
})
export class EditLayerFormComponent implements OnInit {

  @Input() layer: Layer|{} = {};

  layerForm: FormGroup;

  fromYear: number = 0;
  fromMonth: number = 0;
  fromDay: number = 0;

  toYear: number = 0;
  toMonth: number = 0;
  toDay: number = 0;

  city: City|null = null;
  tags: Tag[] = [];

  constructor(private fb: FormBuilder) {
    this.layerForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
      period_start: [0, [Validators.required]],
      period_end: [0, [Validators.required]],
      text: ['', [Validators.required, Validators.minLength(100)]],
      image: [0, [Validators.required, Validators.pattern('(https?://)?([\\da-z.-]+)\\.([a-z.]{2,6})[/\\w .-]*/?')]],
    });
  }

  get name() {
    return this.layerForm.get('name') as FormControl<any>;
  }

  get text() {
    return this.layerForm.get('text');
  }

  get period_start() {
    return this.layerForm.get('period_start');
  }

  get period_end() {
    return this.layerForm.get('period_end');
  }

  get image() {
    return this.layerForm.get('image');
  }

  updateText(text: string) {
    this.text?.setValue(text);
  }

  setTags(tags: Tag[]) {
    this.tags = tags;
  }

  setText(text:string) {
    this.text?.setValue(text);
  }

  setCity(city: City) {
    this.city= city;
  }

  setFromDate() {
    let date = new Date();
    date.setFullYear(this.fromYear);
    if (this.fromMonth)
      date.setMonth(this.fromMonth-1);
    if (this.fromDay)
      date.setDate(this.fromMonth-1);
    this.period_start?.setValue(date.getTime());
  }

  setToDate() {
    let date = new Date();
    date.setFullYear(this.toYear);
    if (this.toMonth)
      date.setMonth(this.toMonth-1);
    if (this.toDay)
      date.setDate(this.toMonth-1);
    this.period_end?.setValue(date.getTime());
  }

  setImage(image: string) {
    this.image?.setValue(image);
  }

  ngOnInit(): void {
    const layer = this.layer as Layer;
    if (layer && layer.id) {
      this.name?.setValue(layer.name);
      this.text?.setValue(layer.text);
      this.period_start?.setValue(layer.period_start);
      this.period_end?.setValue(layer.period_end);
      this.image?.setValue(layer.image);

      const dateStart = new Date(layer.period_start);
      this.fromDay = dateStart.getDay();
      this.fromMonth = dateStart.getMonth()+1;
      this.fromYear = dateStart.getFullYear();

      const dateEnd = new Date(layer.period_end);
      this.toDay = dateEnd.getDay();
      this.toMonth = dateEnd.getMonth()+1;
      this.toYear = dateEnd.getFullYear();
      this.city = layer.city;
      this.tags = layer.tags as Tag[];
    }
  }

}
