import { Injectable } from '@angular/core';
import {Headers, Http} from '@angular/http';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class RetailerService {

  nodeApiUrl = 'http://localhost:1111';

  constructor(private http: Http) { }

  registerRetailer(): Promise<Boolean> {
    return this.http.get(this.nodeApiUrl + '/retailer/register')
      .toPromise()
      .then(response => response.json().data as Boolean)
      .catch(this.handleError);

  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }

}
