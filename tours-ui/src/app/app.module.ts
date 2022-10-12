import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomepageModule } from './homepage/homepage.module';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MaterialModule } from './material/material.module';
import { SidenavListComponent } from './navigation-components/sidenav-list/sidenav-list.component';
import { HeaderComponent } from './navigation-components/header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    PageNotFoundComponent,
    SidenavListComponent,
    HeaderComponent
  ],
  imports: [
    FlexLayoutModule,
    MaterialModule,
    BrowserModule,
    HomepageModule,
    AppRoutingModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})

export class AppModule { }
