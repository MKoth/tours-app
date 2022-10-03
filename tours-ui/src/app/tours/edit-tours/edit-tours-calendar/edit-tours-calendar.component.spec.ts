import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditToursCalendarComponent } from './edit-tours-calendar.component';

describe('EditToursCalendarComponent', () => {
  let component: EditToursCalendarComponent;
  let fixture: ComponentFixture<EditToursCalendarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditToursCalendarComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditToursCalendarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
