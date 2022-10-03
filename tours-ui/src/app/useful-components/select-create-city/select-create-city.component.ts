import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { NewCityCreationDialogComponent } from 'src/app/dialogs/new-city-creation-dialog/new-city-creation-dialog.component';

@Component({
  selector: 'app-select-create-city',
  templateUrl: './select-create-city.component.html',
  styleUrls: ['./select-create-city.component.less']
})
export class SelectCreateCityComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  openDialog(event: MouseEvent): void {
    event.stopPropagation();
    event.preventDefault();
    const dialogRef = this.dialog.open(NewCityCreationDialogComponent, {
      width: '600px',
      data: {city: '', location: {lat:0, lng:0}},
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed', result);
    });
  }

}
