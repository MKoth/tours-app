import { DOCUMENT } from '@angular/common';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpParams } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { catchError, tap, throwError } from 'rxjs';
import { TokenService } from './token.service';

const API_URL = 'http://localhost:8080/auth/realms/my_realm/protocol/openid-connect';
const client_id = 'my_client';
const state = 'fj8o3n7bdy1op5';
const redirect = 'http://localhost:4200/authenticated';
const HTTP_OPTIONS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/x-www-form-urlencoded'
  })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(
    @Inject(DOCUMENT) private document: Document,
    private tokenService: TokenService,
    private http: HttpClient
  ) { }

  redirectForLogin() {
    this.document.location.href = `${API_URL}/auth?client_id=${client_id}&response_type=code&state=${state}&redirect_uri=${redirect}`;
  }

  getTokenByCode(code: string) {
    this.tokenService.removeToken();
    this.tokenService.removeRefreshToken();
    const body = new HttpParams()
      .set('grant_type', 'authorization_code')
      .set('client_id', client_id)
      .set('code', code)
      .set('redirect_uri', redirect);

    return this.http.post<any>(API_URL + '/token', body, HTTP_OPTIONS)
      .pipe(
        tap(res => {
          this.tokenService.saveToken(res.access_token);
          this.tokenService.saveRefreshToken(res.refresh_token);
        }),
        catchError(AuthService.handleError)
      );
  }

  private static handleError(error: HttpErrorResponse): any {
    if (error.error instanceof ErrorEvent) {
      console.error('An error occurred:', error.error.message);
    } else {
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: ${error.error}`);
    }
    return throwError(() => new Error('Error happened'));
  }
}
