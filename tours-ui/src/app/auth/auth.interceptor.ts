import {Injectable} from '@angular/core';
import {HttpErrorResponse, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpResponse} from '@angular/common/http';
import {Router} from '@angular/router';
import {Observable, throwError, timer} from 'rxjs';
import {catchError, map, retry, retryWhen, switchMap} from 'rxjs/operators';
import { TokenService } from './token.service';
import { AuthService } from './auth.service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

    constructor(
        private router: Router,
        private tokenService: TokenService,
        private authService: AuthService) {
    }

    shouldRetry(error: HttpErrorResponse, retryCount:number) {
        if (error.status === 401) {
            console.log("retry count", retryCount);
            if (retryCount==1) {
                //this.authService.refreshToken().subscribe();
            }
            return timer(1000); // Adding a timer from RxJS to return observable to delay param.
        }
        throw error;
    }

    attachAuth(request: HttpRequest<any>) {
        const token = this.tokenService.getToken();
        if (token) {
            request = request.clone({
                setHeaders: {
                    Authorization: 'Bearer ' + token
                }
            });
        }
        return request;
    }
      
    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        request = this.attachAuth(request);
      
        request = request.clone({
            headers: request.headers.set('Accept', 'application/json')
        });

        return next.handle(request).pipe(
            map((event: HttpEvent<any>) => {
                if (event instanceof HttpResponse) {
                    console.log('event--->>>', event);
                }
                return event;
            }),
            catchError((error: HttpErrorResponse) => {
                //console.log(error);
                if (error.status === 401) {
                    return this.authService.refreshToken().pipe(
                        switchMap(() => {
                            request = this.attachAuth(request);
                            return next.handle(request);
                        }),
                        catchError(err => {
                            if (err.status === 401) {
                                this.router.navigate(['login']);
                            }
                            return throwError(() => error);
                        })
                    );
                    // if (error.error.error === 'invalid_token') {
                        
                    // } else {
                    //     this.router.navigate(['login']).then(_ => console.log('redirect to login'));
                    // }
                }
                return throwError(() => error);
            })
            //retry({ count: 4, delay: this.shouldRetry.bind(this) }),
            // catchError((error: HttpErrorResponse) => {
            //     if (error.status === 401) {
            //         this.router.navigate(['login']);
            //     }
            //     return throwError(() => error);
            // })
        );
    }

}
