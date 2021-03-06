import {Component, OnInit} from '@angular/core';
import {InsurerService} from './insurer.service';

@Component({
  selector: 'app-insurer',
  templateUrl: './insurer.component.html',
  styleUrls: ['./insurer.component.css']
})


export class InsurerComponent implements OnInit {

  retailers;

  constructor(private insurerService: InsurerService) {
  }

  register() {
    this.insurerService.registerInsurer();
  }

  onSubmit(form) {
    console.log('onSubmit form', form.value);
    this.insurerService.registerAgreement(form.value);
  }

  ngOnInit() {
    this.insurerService.getRetailers().then(result => this.retailers = result);
    console.log(this.retailers);
  }

}
