import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditPostMapComponent } from './edit-post-map.component';

describe('EditPostMapComponent', () => {
  let component: EditPostMapComponent;
  let fixture: ComponentFixture<EditPostMapComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditPostMapComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditPostMapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
