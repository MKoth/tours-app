import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FilterLayersComponent } from './filter-layers.component';

describe('FilterLayersComponent', () => {
  let component: FilterLayersComponent;
  let fixture: ComponentFixture<FilterLayersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FilterLayersComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FilterLayersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
