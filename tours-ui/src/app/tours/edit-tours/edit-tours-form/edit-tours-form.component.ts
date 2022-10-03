import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-edit-tours-form',
  templateUrl: './edit-tours-form.component.html',
  styleUrls: ['./edit-tours-form.component.less']
})
export class EditToursFormComponent implements OnInit {

  canEnroll: boolean = false;

  constructor() {
  }

  ngOnInit(): void {}

  toggleEnrollability(canEnroll: boolean) {
    this.canEnroll = canEnroll;
  }
}
