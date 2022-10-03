import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditToursFormComponent } from './edit-tours-form.component';

describe('EditToursFormComponent', () => {
  let component: EditToursFormComponent;
  let fixture: ComponentFixture<EditToursFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditToursFormComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditToursFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
