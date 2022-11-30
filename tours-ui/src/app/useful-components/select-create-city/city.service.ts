import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';

const CITY_API_URL = `${environment.api_uri}/tours-locations-layers/city`;

export interface City {
  id: number,
  name: string,
  point: string,
}

@Injectable({
  providedIn: 'root'
})
export class CityService {

  constructor(private http: HttpClient) { }

  getCityById(id: number) {
    return this.http.get<any>(CITY_API_URL+`/${id}`);
  }

  getAllCities() {
    return this.http.get<any>(CITY_API_URL);
  }

  getCityByName(name: string) {
    return this.http.get<any>(CITY_API_URL+`/name/${name}`);
  }

  createCity(newCity: City) {
    return this.http.post<any>(CITY_API_URL, newCity);
  }

  cacheCurrentCity(cachedCity: City) {
    localStorage.setItem("currentCity", JSON.stringify(cachedCity));
  }

  getChachedCity() {
    let city = localStorage.getItem("currentCity");
    return city ? JSON.parse(city):null;
  }
}
