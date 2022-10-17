import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FindTourByNameComponent } from './find-tour-by-name.component';

describe('FindTourByNameComponent', () => {
  let component: FindTourByNameComponent;
  let fixture: ComponentFixture<FindTourByNameComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FindTourByNameComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FindTourByNameComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
