import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const USER_API_URL = 'http://localhost:8081/users-manager/user';

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

  getUserInfo(username:string): Observable<any> {
    return this.http.get<string>(USER_API_URL+`/${username}`);
  }
}
