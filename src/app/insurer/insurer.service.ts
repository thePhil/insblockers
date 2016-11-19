import {Injectable} from '@angular/core';
import {Headers, Http} from '@angular/http';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class InsurerService {

  nodeApiUrl = 'http://localhost:1111';

  constructor(private http: Http) {
  }

  registerInsurer(): Promise<Boolean> {
    return this.http.get(this.nodeApiUrl + '/insurer/register')
      .toPromise()
      .then(response => response.json().data as Boolean)
      .catch(this.handleError);

  }

  registerAgreement(retailer): Promise<Boolean> {
    return this.http.get(this.nodeApiUrl + '/insurer/registerAgreement')
      .toPromise()
      .then(response => response.json().data as Boolean)
      .catch(this.handleError);

  }

  getRetailers(): Promise<Array<string>> {

    return this.http.get(this.nodeApiUrl + '/getRetailers')
      .toPromise()
      .then(response => response.json().data as Array<string>)
      .catch(this.handleError);

  }


  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }

}
