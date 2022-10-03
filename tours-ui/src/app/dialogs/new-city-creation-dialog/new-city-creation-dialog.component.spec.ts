import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewCityCreationDialogComponent } from './new-city-creation-dialog.component';

describe('NewCityCreationDialogComponent', () => {
  let component: NewCityCreationDialogComponent;
  let fixture: ComponentFixture<NewCityCreationDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewCityCreationDialogComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NewCityCreationDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
