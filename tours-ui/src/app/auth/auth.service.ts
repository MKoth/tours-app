import { DOCUMENT } from '@angular/common';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpParams } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { catchError, Observable, Subject, tap, throwError } from 'rxjs';
import { TokenService } from './token.service';
import jwt_decode from 'jwt-decode';
import { Router } from '@angular/router';

const OAUTH_API_URL = 'http://localhost:8080/auth/realms/my_realm/protocol/openid-connect';
const client_id = 'my_client';
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
    private http: HttpClient,
    private router: Router,
  ) { }

  tokenInfo: any = {};
  public isLogged = new Subject<boolean>();
  allowedRolesForEditing = ["ADMIN", "CREATOR"];

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
          this.tokenInfo = this.getDecodedAccessToken();
          this.isLogged.next(true);
        }),
        catchError(AuthService.handleError)
      );
  }

  refreshToken(): Observable<any> {
    console.log("refreshing token");
    if (!this.isAuthenticated())
      this.router.navigate(['login']);
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
          this.tokenInfo = this.getDecodedAccessToken();
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
    this.isLogged.next(false);
    this.http.post<any>(OAUTH_API_URL + '/logout', body, HTTP_OPTIONS).subscribe(()=>{
      this.tokenInfo = {};
      this.tokenService.removeToken();
      this.tokenService.removeRefreshToken();
    });
  }

  getDecodedAccessToken(): any {
    try {
      return jwt_decode(this.tokenService.getToken() as string);
    } catch(Error) {
      return null;
    }
  }

  getDecodedRefreshToken(): any {
    try {
      return jwt_decode(this.tokenService.getRefreshToken() as string);
    } catch(Error) {
      return null;
    }
  }

  isAuthenticated():boolean {
    let refreshToken = this.getDecodedRefreshToken();
    if(refreshToken && refreshToken.exp > (Date.now()/1000)) {
      return true;
    }
    // If token expired or does not exists
    this.tokenService.removeToken();
    this.tokenService.removeRefreshToken();
    return false;
  }

  // ADMIN can edit all items, CREATOR cen edit only those items which he/she created
  canUserEditItem(itemCreatorId: string) {
    if (this.tokenService.getToken() && (!this.tokenInfo || !this.tokenInfo.realm_access)){
      this.tokenInfo = this.getDecodedAccessToken();
    }
    if (this.tokenInfo && this.tokenInfo.realm_access && this.tokenInfo.realm_access.roles) {
      if(this.tokenInfo.realm_access.roles.includes("ADMIN") || 
        (this.tokenInfo.realm_access.roles.includes("CREATOR") 
        && this.tokenInfo.sub == itemCreatorId)
      ) {
        return true;
      }
    }
    return false;
  }

  canUserCreateItem() {
    if (this.tokenInfo && this.tokenInfo.realm_access && this.tokenInfo.realm_access.roles) {
      return this.tokenInfo.realm_access.roles.some((role:string)=>this.allowedRolesForEditing.includes(role));
    }
    return false;
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
