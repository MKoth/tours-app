import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Tag } from '../tags/tags.service';
import { Tour } from '../tours/tour.service';
import { City } from '../useful-components/select-create-city/city.service';
import { environment } from '../../environments/environment';

const LAYERS_API_URL = `${environment.api_uri}/tours-locations-layers/layer`;

export interface Layer {
  id?: number,
  name: string,
  points: Array<string>,
  text: string,
  image: string,
  period_start: number,
  period_end: number,
  creator_id: string,
  tours: Array<Tour>,
  city: City,
  tags: Array<Tag>,
}

@Injectable({
  providedIn: 'root'
})
export class LayerService {

  constructor(private http: HttpClient) { }

  getAllLayers() {
    return this.http.get<any>(LAYERS_API_URL);
  }

  getLayerById(id: number) {
    return this.http.get<any>(LAYERS_API_URL+`/${id}`);
  }

  createLayer(newLayer: Layer) {
    return this.http.post<any>(LAYERS_API_URL, newLayer);
  }

  deleteLayer(id: number) {
    return this.http.delete<any>(LAYERS_API_URL+`/${id}`);
  }

  findLayer(searchParams: string) {
    return this.http.get<any>(LAYERS_API_URL+`/filter?search=${searchParams}`);
  }
}
