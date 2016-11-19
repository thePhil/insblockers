import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {InsurerService} from './insurer.service';
import {HttpModule} from '@angular/http';

@NgModule({
  providers: [
    InsurerService
  ],
  imports: [
    CommonModule,
    HttpModule
  ],
  declarations: []
})
export class InsurerModule {
}
