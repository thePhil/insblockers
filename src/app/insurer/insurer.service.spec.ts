/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { InsurerService } from './insurer.service';

describe('InsurerService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [InsurerService]
    });
  });

  it('should ...', inject([InsurerService], (service: InsurerService) => {
    expect(service).toBeTruthy();
  }));
});
