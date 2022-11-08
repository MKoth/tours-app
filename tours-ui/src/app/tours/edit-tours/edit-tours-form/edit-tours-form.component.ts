import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Layer } from 'src/app/layers/layer.service';
import { Tag } from 'src/app/tags/tags.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Tour } from '../../tour.service';


@Component({
  selector: 'app-edit-tours-form',
  templateUrl: './edit-tours-form.component.html',
  styleUrls: ['./edit-tours-form.component.less']
})
export class EditToursFormComponent implements OnInit {

  @Input() tour: Tour|{} = {};

  tourForm: FormGroup;

  city: City|null = null;
  tags: Tag[] = [];

  constructor(private fb: FormBuilder) {
    this.tourForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
      text: ['', [Validators.required, Validators.minLength(100)]],
      image: [0, [Validators.required, Validators.pattern('(https?://)?([\\da-z.-]+)\\.([a-z.]{2,6})[/\\w .-]*/?')]],
      layer: [0, [Validators.required]],
      duration: [0, [Validators.required]],
    });
  }

  get name() {
    return this.tourForm.get('name') as FormControl<string>;
  }

  get text() {
    return this.tourForm.get('text');
  }
  
  get image() {
    return this.tourForm.get('image');
  }

  get layer() {
    return this.tourForm.get('layer');
  }

  get duration() {
    return this.tourForm.get('duration') as FormControl<number>;
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

  setLayer(layerId: number) {
    this.layer?.setValue(layerId);
  }

  setImage(image: any) {
    this.image?.setValue(image);
  }

  ngOnInit(): void {
    const tour = this.tour as Tour;
    if (tour && tour.id) {
      this.name?.setValue(tour.name);
      this.text?.setValue(tour.text);
      this.image?.setValue(tour.image);
      this.duration?.setValue(tour.duration);
      this.layer?.setValue((tour.layer as Layer).id);
      this.city = tour.city;
      this.tags = tour.tags as Tag[];
    }
  }
}
