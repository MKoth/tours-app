import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToursAvailabilityDialogComponent } from './tours-availability-dialog.component';

describe('ToursAvailabilityDialogComponent', () => {
  let component: ToursAvailabilityDialogComponent;
  let fixture: ComponentFixture<ToursAvailabilityDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToursAvailabilityDialogComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ToursAvailabilityDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
