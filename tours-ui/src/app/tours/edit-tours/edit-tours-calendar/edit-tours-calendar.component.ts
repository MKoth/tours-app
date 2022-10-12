import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ToursAvailabilityDialogComponent } from 'src/app/dialogs/tours-availability-dialog/tours-availability-dialog.component';

@Component({
  selector: 'app-edit-tours-calendar',
  templateUrl: './edit-tours-calendar.component.html',
  styleUrls: ['./edit-tours-calendar.component.less']
})
export class EditToursCalendarComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  openDialog(event: MouseEvent): void {
    event.stopPropagation();
    event.preventDefault();
    const dialogRef = this.dialog.open(ToursAvailabilityDialogComponent, {
      width: '600px',
      data: {city: '', location: {lat:0, lng:0}},
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed', result);
    });
  }
}
