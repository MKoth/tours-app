import { HttpErrorResponse, HttpEventType } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { ProgressBarMode } from '@angular/material/progress-bar';
import { AuthService } from 'src/app/auth/auth.service';
import { FilesService } from 'src/app/files.service';

export interface SelectedImageData {
  img_uri: string;
}

@Component({
  selector: 'app-select-upload-file-dialog',
  templateUrl: './select-upload-file-dialog.component.html',
  styleUrls: ['./select-upload-file-dialog.component.less']
})
export class SelectUploadFileDialogComponent implements OnInit {

  mode: ProgressBarMode = 'determinate';
  progress = 0;
  //bufferValue = 75;
  isLoading = true;
  isError = false;
  isSuccess = false;
  pageText = "Images are loading...";
  selectedFile: string = "";

  constructor(
    public dialogRef: MatDialogRef<SelectUploadFileDialogComponent>,
    private filesService: FilesService,
    private authService: AuthService
  ) { }

  onCancelClick(): void {
    this.dialogRef.close();
  }

  selectImage(event: MouseEvent) {
    let image = event.target as HTMLImageElement;
    this.selectedFile = image.currentSrc;
  }

  uploadImage(files:FileList | null) {
    if(!files?.length) return;
    const userId = this.authService.getDecodedAccessToken()?.sub;
    if (!userId) return;
    this.filesService.uploadImageFile(files[0], userId).subscribe({
      next: (event) => {
        if (event.type === HttpEventType.UploadProgress)
          this.progress = Math.round(100 * event.loaded / (event.total as number));
        else if (event.type === HttpEventType.Response) {
          console.log(event.body);
          this.filesService.getImagesList(userId).subscribe();
        }
      },
      error: (err: HttpErrorResponse) => console.log(err)
    });
    
  }

  ngOnInit(): void {
    setTimeout(()=>{
      this.isLoading = false;
      this.isError = false;
      this.isSuccess = true;
      //this.pageText = "Error happened while loading images, please try again later!";
      this.pageText = "";
    }, 1000);
  }

}
