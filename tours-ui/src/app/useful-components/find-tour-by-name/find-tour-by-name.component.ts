import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Tour, TourService } from 'src/app/tours/tour.service';

@Component({
  selector: 'app-find-tour-by-name',
  templateUrl: './find-tour-by-name.component.html',
  styleUrls: ['./find-tour-by-name.component.less']
})
export class FindTourByNameComponent implements OnInit {

  @Output() changeTour = new EventEmitter<any>();
  @Input() cityId: number = 0;
  @Input() tourId: number = 0;
  
  tour = new FormControl();
  allToursList: Tour[] = [];
  toursList: Tour[] = this.allToursList;
  value: string = '';

  constructor(private tourService: TourService) { }

  ngOnInit(): void {
    this.tourService.findTour("city:" + this.cityId).subscribe(result=>{
      this.allToursList = result;
    });

    if (this.tourId) {
      this.tour.setValue(this.tourId);
    }
  }

  onChange() {
    this.changeTour.emit(this.tour.value());
  }

  onKey() {
    this.toursList = this.allToursList.filter(option => option.name.toLowerCase().includes(this.value.toLowerCase()));
  }

  clearSearch() {
    this.toursList = this.allToursList;
    this.value = "";
  }

}
