import { Component, OnInit } from '@angular/core';
import { CalendarEvent } from 'angular-calendar';

@Component({
  selector: 'app-tours-avaliability-calendar',
  templateUrl: './tours-avaliability-calendar.component.html',
  styleUrls: ['./tours-avaliability-calendar.component.less']
})
export class ToursAvaliabilityCalendarComponent implements OnInit {

  constructor() { }

  viewDate: Date = new Date();

  events: CalendarEvent[] = [
    {
      title: 'An all day event',
      start: new Date(),
      allDay: true,
    },
    {
      title: 'A non all day event',
      start: new Date(),
    },
  ];

  ngOnInit(): void {
  }

}
