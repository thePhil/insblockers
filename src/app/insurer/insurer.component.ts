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
    this.retailers = this.insurerService.fetchRetailers().then(result => this.retailers = result);
  }

}
