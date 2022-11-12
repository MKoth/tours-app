import { Component, EventEmitter, Injector, Input, NgZone, OnInit, Output, ViewContainerRef } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { SelectUploadFileDialogComponent } from 'src/app/dialogs/select-upload-file-dialog/select-upload-file-dialog.component';
declare let tinymce: any;

@Component({
  selector: 'app-text-editor',
  templateUrl: './text-editor.component.html',
  styleUrls: ['./text-editor.component.less']
})
export class TextEditorComponent implements OnInit {

  @Output() onTextChange = new EventEmitter<any>();
  @Input() text: string = '';

  tinymceInit: any;

  constructor(public dialog: MatDialog, private ngZone: NgZone) {
    this.tinymceInit = { 
      plugins: 'lists link image table code help wordcount',
      toolbar: 'image',
      image_advtab: true,
      file_picker_callback: (cb: any, value: any, meta: any) => {
        this.selectFileDialog(cb);
      }
    };
  }

  handleChange() {
    this.onTextChange.emit(this.text);
  }

  ngOnInit(): void {
  }

  selectFileDialog(callback: any) {
    const matDialogConfig: MatDialogConfig = {
      width: '600px',
      minHeight: '400px',
      backdropClass: 'image-selection-dialog-backdrop',
      panelClass: 'image-selection-dialog-backdrop'
    };
    this.ngZone.run(() => {
      const dialogRef = this.dialog.open(SelectUploadFileDialogComponent, matDialogConfig);

      dialogRef.afterClosed().subscribe(result => {
        console.log('The dialog was closed', result);
        if (result)
          callback(result);
      });
    });
    
  }
}
