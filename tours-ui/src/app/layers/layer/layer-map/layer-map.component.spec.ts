import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LayerMapComponent } from './layer-map.component';

describe('LayerMapComponent', () => {
  let component: LayerMapComponent;
  let fixture: ComponentFixture<LayerMapComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LayerMapComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LayerMapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
