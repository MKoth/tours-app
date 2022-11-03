import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
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

  constructor(public dialog: MatDialog) {
    this.tinymceInit = { 
      plugins: 'lists link image table code help wordcount',
      toolbar: 'image',
      image_advtab: true,
      file_picker_callback: function(cb: any, value: any, meta: any) {
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
    const dialogRef = this.dialog.open(SelectUploadFileDialogComponent, {
      width: '600px',
      minHeight: '400px'
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed', result);
      if (result)
        callback(result);
    });
  }
}
