import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectCreateCityComponent } from './select-create-city.component';

describe('SelectCreateCityComponent', () => {
  let component: SelectCreateCityComponent;
  let fixture: ComponentFixture<SelectCreateCityComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SelectCreateCityComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SelectCreateCityComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
