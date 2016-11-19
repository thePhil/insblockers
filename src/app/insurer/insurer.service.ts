import { Injectable } from '@angular/core';
import {Headers, Http} from '@angular/http';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class InsurerService {

  constructor(private http: Http) { }

  registerInsurer():Promise<Boolean>{
    return this.http.get('http://localhost:1111/insurer/register')
      .toPromise()
      .then(response => response.json().data as Boolean)
      .catch(this.handleError);

  }


  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }

}
