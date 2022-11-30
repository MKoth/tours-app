import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

const USER_API_URL = `${environment.api_uri}/users-manager/user`;
const HTTP_OPTIONS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/x-www-form-urlencoded'
  })
};

interface User {
  userName:string;
  emailId:string;
  password:string;
  firstName:string;
  lastName:string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  registerNewUser(user:User): Observable<string> {
    return this.http.post<string>(USER_API_URL, user);
  }

  updateUser(user:User, userId:string): Observable<string> {
    return this.http.put<string>(USER_API_URL+`/${userId}`, user);
  }

  assignCreatorRoleToUser(userId:string): Observable<string> {
    return this.http.get<string>(USER_API_URL+`/assignCreatorRole/${userId}`);
  }

  updateProfileImage(userId:string, imageUrl:string): Observable<string> {
    const body = new HttpParams()
      .set('imageUrl', imageUrl)
    return this.http.post<any>(USER_API_URL+`/updateProfileImage/${userId}`, body, HTTP_OPTIONS);
  }

  getUserInfo(username:string): Observable<any> {
    return this.http.get<any>(USER_API_URL+`/${username}`);
  }
}
