import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { AuthService } from 'src/app/auth/auth.service';
import { SelectUploadFileDialogComponent } from 'src/app/dialogs/select-upload-file-dialog/select-upload-file-dialog.component';
import { UserService } from '../user.service';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.less']
})
export class UserProfileComponent implements OnInit {

  constructor(
    private authService: AuthService, 
    private userService: UserService,
    public dialog: MatDialog) { }

  allowedRoles = ["ADMIN", "CREATOR", "USER"];

  tokenInfo: any = {};

  ngOnInit(): void {
    this.tokenInfo = this.authService.getDecodedAccessToken();
    this.tokenInfo = this.tokenInfo ? this.tokenInfo : {};
  }

  getUserRole() {
    if (this.tokenInfo && this.tokenInfo.realm_access && this.tokenInfo.realm_access.roles) {
      return this.tokenInfo.realm_access.roles.find((role:string) => this.allowedRoles.includes(role));
    }
  }

  updateRoleToCreator() {
    this.userService.getUserInfo(this.tokenInfo.preferred_username).subscribe(data=>console.log(data));
    this.userService.assignCreatorRoleToUser(this.tokenInfo.sub).subscribe({
      complete: ()=>{
        console.log("assign role completed");
        this.authService.refreshToken().subscribe(()=>{
          this.tokenInfo = this.authService.getDecodedAccessToken();
          this.tokenInfo = this.tokenInfo ? this.tokenInfo : {};
          console.log("token refreshed");
        });
      },
      error: (error)=>{
        console.log("Error happened", error);
      }
    });
  }

  selectFileDialog() {
    console.log("Selct file dialog");
    const dialogRef = this.dialog.open(SelectUploadFileDialogComponent, {
      width: '600px',
      data: {city: '', location: {lat:0, lng:0}},
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed', result);
    });
  }
}
