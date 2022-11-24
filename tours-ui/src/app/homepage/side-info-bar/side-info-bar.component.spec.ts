import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SideInfoBarComponent } from './side-info-bar.component';

describe('SideInfoBarComponent', () => {
  let component: SideInfoBarComponent;
  let fixture: ComponentFixture<SideInfoBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SideInfoBarComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SideInfoBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
