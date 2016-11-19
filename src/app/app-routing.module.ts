import {NgModule}             from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {RetailerComponent} from './retailer/retailer.component';
import {DashboardComponent} from './dashboard/dashboard.component';
import {InsurerComponent} from './insurer/insurer.component';
import {CustomerComponent} from './customer/customer.component';
import {ServiceAgentComponent} from './service-agent/service-agent.component';

const routes: Routes = [
  {path: '', redirectTo: '/dashboard', pathMatch: 'full'},
  {path: 'dashboard', component: DashboardComponent},
  {path: 'retailer', component: RetailerComponent},
  {path: 'insurer', component: InsurerComponent},
  {path: 'customer', component: CustomerComponent},
  {path: 'service', component: ServiceAgentComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}


/*
 Copyright 2016 Google Inc. All Rights Reserved.
 Use of this source code is governed by an MIT-style license that
 can be found in the LICENSE file at http://angular.io/license
 */
