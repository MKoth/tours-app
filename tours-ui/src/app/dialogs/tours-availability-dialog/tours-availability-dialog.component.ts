import { Component, Inject, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { RRule } from 'rrule';

@Component({
  selector: 'app-tours-availability-dialog',
  templateUrl: './tours-availability-dialog.component.html',
  styleUrls: ['./tours-availability-dialog.component.less']
})
export class ToursAvailabilityDialogComponent implements OnInit {

  dateStart:Date = new Date();
  duration:number = 1;
  rrules: Array<RRule> = [];

  months: Array<string> = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  days: Array<number> = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,
                        18,19,20,21,22,23,24,25,26,27,28,29,30,31];

  fromDatetime = new FormControl('');
  toDatetime = new FormControl('');

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<ToursAvailabilityDialogComponent>,
  ) { }

  ngOnInit(): void {
    
  }

  addRrule() {
    this.rrules.push(new RRule());
  }

  removeRrule(index:number) {
    this.rrules.splice(index, 1);
  }

  test(value:any) {
    console.log(value);
  }

  onCancelClick(): void {
    this.dialogRef.close();
  }
}
