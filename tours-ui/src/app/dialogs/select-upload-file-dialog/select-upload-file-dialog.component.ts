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
  isLoading = true;
  isError = false;
  isSuccess = false;
  pageText = "Images are loading...";
  selectedFile: string = "";
  userId: string = "";
  images: Array<any> = [];

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

  deleteImage(imageId: string) {
    if (confirm("Are you sure, you want to delete image?")){
      this.filesService.deleteImage(this.userId, imageId).subscribe({
        next: (response) => {
          if (Array.isArray(response))
            this.images = response;
          this.pageText = this.images.length?"":"No images yet, upload some!";
        },
        error: (err: HttpErrorResponse) => console.log(err)
      });
    }
  }

  uploadImage(files:FileList | null) {
    this.progress = 0;
    if(!files?.length || !this.userId) return;
    this.filesService.uploadImageFile(files[0], this.userId).subscribe({
      next: (event) => {
        if (event.type === HttpEventType.UploadProgress){
          this.progress = Math.round(100 * event.loaded / (event.total as number));
          console.log("progress ", this.progress);
        }
        else if (event.type === HttpEventType.Response) {
          this.images = event.body as Array<any>;
          this.pageText = "";
        }
      },
      error: (err: HttpErrorResponse) => console.log(err)
    });
    
  }

  ngOnInit(): void {
    this.userId = this.authService.getDecodedAccessToken()?.sub;
    if (!this.userId) {
      this.isSuccess = false;
      this.isLoading = false;
      this.isError = true;
      this.pageText = "Error happened while loading images, please try again later!";
      return;
    }
    this.filesService.getImagesList(this.userId).subscribe({
      next: (res:any) => {
        this.images = res;
        this.isSuccess = true;
        this.isLoading = false;
        this.isError = false;
        this.pageText = this.images.length?"":"No images yet, upload some!";
      },
      error: err => {
        console.error(err);
        this.isSuccess = false;
        this.isLoading = false;
        this.isError = true;
        this.pageText = "Error happened while loading images, please try again later!";
      }
    })
  }

}
