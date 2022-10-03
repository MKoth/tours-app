import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditToursMapComponent } from './edit-tours-map.component';

describe('EditToursMapComponent', () => {
  let component: EditToursMapComponent;
  let fixture: ComponentFixture<EditToursMapComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditToursMapComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditToursMapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
