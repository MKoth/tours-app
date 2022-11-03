import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

const TAGS_API_URL = 'http://localhost:8081/tours-locations-layers/tag';

export interface Tag {
  id?: number,
  name:string
}

@Injectable({
  providedIn: 'root'
})
export class TagsService {

  constructor(private http: HttpClient) { }

  getTags() {
    return this.http.get<any>(TAGS_API_URL);
  }

  geTagByName(name: string) {
    return this.http.get<any>(TAGS_API_URL+`/${name}`);
  }

  geTagsLike(like: string) {
    return this.http.get<any>(TAGS_API_URL+`/find?like=${like}`);
  }

  createTag(newTag: Tag) {
    return this.http.post<any>(TAGS_API_URL, newTag);
  }
}
