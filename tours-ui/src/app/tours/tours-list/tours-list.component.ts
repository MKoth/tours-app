import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { Tour, TourService } from '../tour.service';

@Component({
  selector: 'app-tours-list',
  templateUrl: './tours-list.component.html',
  styleUrls: ['./tours-list.component.less']
})
export class ToursListComponent implements OnInit {

  tours:Array<Tour> = [];
  search = "";
  excerptLength = 300;

  constructor(
    private tourService: TourService,
    private activatedRoute: ActivatedRoute,
    private authService: AuthService
  ) { }

  canUserCreateItem() {
    return this.authService.canUserCreateItem();
  }

  ngOnInit(): void {
    this.activatedRoute.queryParams.subscribe(params => {
      const search = params['search'];
      if(search && search !== this.search) {
        this.search = search;
        this.tourService.findTour(search).subscribe(result=>{
          this.tours = result;
        });
      } else {
        this.tourService.getAllTours().subscribe(result=>{
          this.tours = result;
        });
      }
    });
  }

  turnicateText(text: string) {
    const regexp = /(<([^>]+)>)/gi;
    const strippedText = text.replace(regexp, "");
    return strippedText.substring(0, this.excerptLength)+"...";
  }

  getDuration(minutes: number) {
    const h = Math.floor(minutes / 60);
    const m = minutes % 60;
    return h+"h "+m+"min";
  }

}
