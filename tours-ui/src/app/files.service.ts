import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../environments/environment';

const FILES_API_URL = `${environment.api_uri}/files-uploader`;
const HTTP_OPTIONS = {
  headers: new HttpHeaders({
    'Content-Type': 'multipart/form-data'
  }),
  reportProgress: true,
  observe: "event"
};

@Injectable({
  providedIn: 'root'
})
export class FilesService {

  constructor(private http: HttpClient) {

  }

  getImagesList(userId:string) {
    return this.http.get<Array<any>>(FILES_API_URL + `/images/${userId}`);
  }

  uploadImageFile(file:File, userId:string) {
    const formData = new FormData();
    formData.append('file', file, file.name);
    return this.http.post(FILES_API_URL + `/image/upload/${userId}`, formData, {
      reportProgress: true,
      observe: "events"
    })
  }

  deleteImage(userId:string, fileId:string) {
    return this.http.delete<Array<any>>(FILES_API_URL + `/file/image/${userId}/${fileId}`);
  }
}
