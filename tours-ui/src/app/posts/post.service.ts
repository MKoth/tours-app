import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Layer } from '../layers/layer.service';
import { Tag } from '../tags/tags.service';
import { Tour } from '../tours/tour.service';
import { City } from '../useful-components/select-create-city/city.service';

const POSTS_API_URL = 'http://localhost:8081/tours-locations-layers/location';

export interface Post {
  id?: number,
  name: string,
  text: string,
  image: string,
  point: string,
  period_start: number,
  period_end: number,
  creator_id: string,
  city: City,
  layer: Layer|{},
  tour: Tour|{},
  tags: Array<Tag>,
  ordering: number
}

@Injectable({
  providedIn: 'root'
})
export class PostService {

  constructor(private http: HttpClient) { }

  getAllPosts() {
    return this.http.get<any>(POSTS_API_URL);
  }

  getPostById(id: number) {
    return this.http.get<any>(POSTS_API_URL+`/${id}`);
  }

  createPost(newPost: Post) {
    return this.http.post<any>(POSTS_API_URL, newPost);
  }

  deletePost(id: number) {
    return this.http.delete<any>(POSTS_API_URL+`/${id}`);
  }

  findPost(searchParams: string) {
    return this.http.get<any>(POSTS_API_URL+`?search=${searchParams}`);
  }
}
