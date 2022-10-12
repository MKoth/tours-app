import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToursAvaliabilityCalendarComponent } from './tours-avaliability-calendar.component';

describe('ToursAvaliabilityCalendarComponent', () => {
  let component: ToursAvaliabilityCalendarComponent;
  let fixture: ComponentFixture<ToursAvaliabilityCalendarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToursAvaliabilityCalendarComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ToursAvaliabilityCalendarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
