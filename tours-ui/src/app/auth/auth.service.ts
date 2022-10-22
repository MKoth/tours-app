import { DOCUMENT } from '@angular/common';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpParams } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { catchError, Observable, Subject, tap, throwError } from 'rxjs';
import { TokenService } from './token.service';

const OAUTH_API_URL = 'http://localhost:8080/auth/realms/my_realm/protocol/openid-connect';
const client_id = 'my_client';
const redirect = 'http://localhost:4200/authenticated';
const logoutRedirect = 'http://localhost:4200/home';
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

  public isLogged = new Subject<boolean>();

  redirectForLogin() {
    this.document.location.href = `${OAUTH_API_URL}/auth?client_id=${client_id}&response_type=code&redirect_uri=${redirect}`;
  }

  getTokenByCode(code: string): Observable<any> {
    this.tokenService.removeToken();
    this.tokenService.removeRefreshToken();
    const body = new HttpParams()
      .set('grant_type', 'authorization_code')
      .set('client_id', client_id)
      .set('code', code)
      .set('redirect_uri', redirect);

    return this.http.post<any>(OAUTH_API_URL + '/token', body, HTTP_OPTIONS)
      .pipe(
        tap(res => {
          this.tokenService.saveToken(res.access_token);
          this.tokenService.saveRefreshToken(res.refresh_token);
          this.isLogged.next(true);
        }),
        catchError(AuthService.handleError)
      );
  }

  refreshToken(): Observable<any> {
    let refresh_token = this.tokenService.getRefreshToken();
    this.tokenService.removeToken();
    this.tokenService.removeRefreshToken();
    const body = new HttpParams()
      .set('refresh_token', refresh_token as string)
      .set('grant_type', 'refresh_token')
      .set('client_id', client_id);

    return this.http.post<any>(OAUTH_API_URL + '/token', body, HTTP_OPTIONS)
      .pipe(
        tap(res => {
          this.tokenService.saveToken(res.access_token);
          this.tokenService.saveRefreshToken(res.refresh_token);
          this.isLogged.next(true);
        }),
        catchError(AuthService.handleError)
      );
  }

  logout() {
    const refresh_token = this.tokenService.getRefreshToken()
    const body = new HttpParams()
      .set('refresh_token', refresh_token as string)
      .set('client_id', client_id);
    this.tokenService.removeToken();
    this.tokenService.removeRefreshToken();
    this.isLogged.next(false);
    this.http.post<any>(OAUTH_API_URL + '/logout', body, HTTP_OPTIONS).subscribe();
  }

  isAuthenticated():boolean {
    return this.tokenService.getToken()? true:false;
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
