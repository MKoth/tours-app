import { Injectable } from '@angular/core';

const ACCESS_TOKEN = 'access_token';
const REFRESH_TOKEN = 'refresh_token';
const REDIRECT_URL = 'redirect_url';

@Injectable({
  providedIn: 'root'
})
export class TokenService {
  getToken(): string | null {
    return localStorage.getItem(ACCESS_TOKEN);
  }

  getRefreshToken(): string | null {
    return localStorage.getItem(REFRESH_TOKEN);
  }

  saveToken(token: string): void {
    localStorage.setItem(ACCESS_TOKEN, token);
  }

  saveRefreshToken(refreshToken: string): void {
    localStorage.setItem(REFRESH_TOKEN, refreshToken);
  }

  removeToken(): void {
    localStorage.removeItem(ACCESS_TOKEN);
  }

  removeRefreshToken(): void {
    localStorage.removeItem(REFRESH_TOKEN);
  }

  saveCurrentUrl(): string {
    localStorage.setItem(REDIRECT_URL, window.location.href);
    return window.location.href;
  }
  getCurrentUrl(): string | null {
    return localStorage.getItem(REDIRECT_URL);
  }
}
