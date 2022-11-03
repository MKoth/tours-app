import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { SelectUploadFileDialogComponent } from 'src/app/dialogs/select-upload-file-dialog/select-upload-file-dialog.component';

@Component({
  selector: 'app-attach-image',
  templateUrl: './attach-image.component.html',
  styleUrls: ['./attach-image.component.less']
})
export class AttachImageComponent implements OnInit {
  @Input() imageUrl:string = "";
  @Output() onChange = new EventEmitter<string>();

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  openImageDialog() {
    const dialogRef = this.dialog.open(SelectUploadFileDialogComponent, {
      width: '600px',
      minHeight: '400px'
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed', result);
      this.imageUrl = result;
      this.onChange.emit(result);
    });
  }
}
