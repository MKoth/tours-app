import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Layer } from '../layers/layer.service';
import { Post } from '../posts/post.service';
import { Tag } from '../tags/tags.service';
import { City } from '../useful-components/select-create-city/city.service';
import { environment } from '../../environments/environment';

const TOURS_API_URL = `${environment.api_uri}/tours-locations-layers/tour`;

export interface Tour {
  id?: number,
  name: string,
  text: string,
  image: string,
  period_start: number,
  period_end: number,
  creator_id: string,
  city: City,
  layer: Layer|{},
  locations: Array<Post>,
  tags: Array<Tag>,
  duration: number
}

@Injectable({
  providedIn: 'root'
})
export class TourService {

  constructor(private http: HttpClient) { }

  getAllTours() {
    return this.http.get<any>(TOURS_API_URL);
  }

  getTourById(id: number) {
    return this.http.get<any>(TOURS_API_URL+`/${id}`);
  }

  createTour(newTour: Tour) {
    return this.http.post<any>(TOURS_API_URL, newTour);
  }

  deleteTour(id: number) {
    return this.http.delete<any>(TOURS_API_URL+`/${id}`);
  }

  findTour(searchParams: string) {
    return this.http.get<any>(TOURS_API_URL+`/filter?search=${searchParams}`);
  }
}
