import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditLayerMapComponent } from './edit-layer-map.component';

describe('EditLayerMapComponent', () => {
  let component: EditLayerMapComponent;
  let fixture: ComponentFixture<EditLayerMapComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditLayerMapComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditLayerMapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
