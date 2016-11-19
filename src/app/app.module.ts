import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { MaterialModule } from '@angular/material';

import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { RetailerComponent } from './retailer/retailer.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { InsurerComponent } from './insurer/insurer.component';
import { CustomerComponent } from './customer/customer.component';
import { ServiceAgentComponent } from './service-agent/service-agent.component';
import {InsurerService} from "./insurer/insurer.service";

@NgModule({
  declarations: [
    AppComponent,
    RetailerComponent,
    DashboardComponent,
    InsurerComponent,
    CustomerComponent,
    ServiceAgentComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    MaterialModule.forRoot(),
    AppRoutingModule
  ],
  providers: [
    InsurerService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
