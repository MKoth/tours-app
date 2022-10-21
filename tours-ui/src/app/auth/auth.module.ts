import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthRoutingModule } from './auth-routing.module';
import { RegistrationComponent } from './registration/registration.component';
import { MaterialModule } from '../material/material.module';
import { LoginComponent } from './login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { AuthenticatedComponent } from './authenticated/authenticated.component';


@NgModule({
  declarations: [
    RegistrationComponent,
    LoginComponent,
    AuthenticatedComponent
  ],
  imports: [
    CommonModule,
    MaterialModule,
    AuthRoutingModule,
    HttpClientModule
  ]
})
export class AuthModule { }
