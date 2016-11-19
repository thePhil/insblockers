import {Component, OnInit} from '@angular/core';
import {RetailerService} from "./retailer.service";

@Component({
  // moduleId: module.id,
  selector: 'app-retailer',
  templateUrl: './retailer.component.html',
  styleUrls: ['./retailer.component.css']
})
export class RetailerComponent implements OnInit {

  constructor(private retailerService: RetailerService) {
  }

  register(): void {
    this.retailerService.registerRetailer();
  }

  ngOnInit() {
  }

}
