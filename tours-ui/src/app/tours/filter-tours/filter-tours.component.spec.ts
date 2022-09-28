import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FilterToursComponent } from './filter-tours.component';

describe('FilterToursComponent', () => {
  let component: FilterToursComponent;
  let fixture: ComponentFixture<FilterToursComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FilterToursComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FilterToursComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
