import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectUploadFileDialogComponent } from './select-upload-file-dialog.component';

describe('SelectUploadFileDialogComponent', () => {
  let component: SelectUploadFileDialogComponent;
  let fixture: ComponentFixture<SelectUploadFileDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SelectUploadFileDialogComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SelectUploadFileDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
