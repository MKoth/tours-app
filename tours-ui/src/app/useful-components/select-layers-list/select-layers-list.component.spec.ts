import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectLayersListComponent } from './select-layers-list.component';

describe('SelectLayersListComponent', () => {
  let component: SelectLayersListComponent;
  let fixture: ComponentFixture<SelectLayersListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SelectLayersListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SelectLayersListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
