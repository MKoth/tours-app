import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Layer } from 'src/app/layers/layer.service';
import { Tag } from 'src/app/tags/tags.service';
import { Tour } from 'src/app/tours/tour.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Post } from '../../post.service';

@Component({
  selector: 'app-edit-post-form',
  templateUrl: './edit-post-form.component.html',
  styleUrls: ['./edit-post-form.component.less']
})
export class EditPostFormComponent implements OnInit {

  @Input() post: Post|{} = {};

  postForm: FormGroup;

  fromYear: number = 0;
  fromMonth: number = 0;
  fromDay: number = 0;

  toYear: number = 0;
  toMonth: number = 0;
  toDay: number = 0;

  city: City|null = null;
  tags: Tag[] = [];

  constructor(private fb: FormBuilder) {
    this.postForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
      period_start: [0, [Validators.required]],
      period_end: [0, [Validators.required]],
      text: ['', [Validators.required, Validators.minLength(100)]],
      image: [0, [Validators.required, Validators.pattern('(https?://)?([\\da-z.-]+)\\.([a-z.]{2,6})[/\\w .-]*/?')]],
      layer: [0, [Validators.required]],
      tour: [0, [Validators.required]],
      ordering: [0, [Validators.required]]
    });
  }

  get name() {
    return this.postForm.get('name');
  }

  get text() {
    return this.postForm.get('text');
  }

  get period_start() {
    return this.postForm.get('period_start');
  }

  get period_end() {
    return this.postForm.get('period_end');
  }

  get image() {
    return this.postForm.get('image');
  }

  get layer() {
    return this.postForm.get('layer');
  }

  get tour() {
    return this.postForm.get('tour');
  }

  get ordering() {
    return this.postForm.get('ordering');
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

  setLayer(layerId: number) {
    this.layer?.setValue(layerId);
  }

  setTour(tourId: number) {
    this.tour?.setValue(tourId);
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
    const post = this.post as Post;
    if (post && post.id) {
      this.name?.setValue(post.name);
      this.text?.setValue(post.text);
      this.period_start?.setValue(post.period_start);
      this.period_end?.setValue(post.period_end);
      this.image?.setValue(post.image);
      this.layer?.setValue((post.layer as Layer).id);
      this.tour?.setValue((post.tour as Tour).id);
      this.ordering?.setValue(post.ordering);

      const dateStart = new Date(post.period_start);
      this.fromDay = dateStart.getDay();
      this.fromMonth = dateStart.getMonth()+1;
      this.fromYear = dateStart.getFullYear();

      const dateEnd = new Date(post.period_end);
      this.toDay = dateEnd.getDay();
      this.toMonth = dateEnd.getMonth()+1;
      this.toYear = dateEnd.getFullYear();
      this.city = post.city;
      this.tags = post.tags as Tag[];
    }
  }

}
