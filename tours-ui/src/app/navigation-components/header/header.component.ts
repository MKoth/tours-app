import { EventEmitter } from '@angular/core';
import { Output } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { TokenService } from 'src/app/auth/token.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.less']
})
export class HeaderComponent implements OnInit {
  @Output() public sidenavToggle = new EventEmitter();

  isLogged:boolean = false;
  
  constructor(
    private authService:AuthService,
    private tokenService: TokenService,
    private router: Router) { }

  ngOnInit(): void {
    this.isLogged = this.authService.isAuthenticated();
    this.authService.isLogged.subscribe(value=>{
      this.isLogged = value;
    })
  }

  onToggleSidenav = () => {
    this.sidenavToggle.emit();
  }

  goToLogin() {
    this.tokenService.saveCurrentUrl(this.router.url);
    this.router.navigateByUrl("/login");
  }

  logout() {
    this.authService.logout();
    this.isLogged = false;
  }
}
