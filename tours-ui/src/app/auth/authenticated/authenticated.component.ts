import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap } from 'rxjs';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-authenticated',
  templateUrl: './authenticated.component.html',
  styleUrls: ['./authenticated.component.less']
})
export class AuthenticatedComponent implements OnInit {

  private code:string = '';
  public isLoading:boolean = true;
  public isError:boolean = false;
  public pageText = 'Authentication is In Progress...';

  constructor(
    private route:ActivatedRoute,
    private authService:AuthService,
    private router: Router) { }

  ngOnInit(): void {
    this.code = this.route.snapshot.queryParams['code'];
    this.authService.getTokenByCode(this.code).subscribe({
      error: () => {
        this.isLoading = false;
        this.isError = true;
        this.pageText = 'Error happened while attempting to Login, please try again later!';
      },
      complete: () => {
        this.router.navigateByUrl('home');
      }
    });
  }

}
