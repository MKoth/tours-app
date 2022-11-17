import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Post, PostService } from 'src/app/posts/post.service';
import { Tour, TourService } from '../tour.service';

let map:google.maps.Map;
let poly:google.maps.Polyline;

@Component({
  selector: 'app-tour',
  templateUrl: './tour.component.html',
  styleUrls: ['./tour.component.less']
})
export class TourComponent implements OnInit {
  tourId: number = 0;
  tour: Tour | null = null;
  posts:Array<Post> = [];
  isLoading:boolean = false;
  isError:boolean = false;
  excerptLength = 300;

  constructor(
    private postService: PostService,
    private tourService: TourService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.isLoading = true;
    this.tourService.getTourById(parseInt(id as string)).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.tour = result;
        this.postService.findPost("tour:"+this.tour?.id).subscribe(res=>{
          this.posts = res;
        })
        this.initMap();
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

  initMap() {
    let cityLatLng = this.tour?.city.point.split(",").map(coord=>parseFloat(coord));
    let mapProp = {
      center: new google.maps.LatLng((cityLatLng as number[])[0], (cityLatLng as number[])[1]),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("googleMapTour") as HTMLElement, mapProp);
    poly = new google.maps.Polyline({
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
      path:this.tour?.locations.map(point=>{
        let pointArr = point.point.split(",");
        return new google.maps.LatLng(parseFloat(pointArr[0]), parseFloat(pointArr[1]));
      })
    });
  
    poly.setMap(map);
  }

  getDateRange(tour: Tour) {
    let from = new Date(tour.period_start);
    let to = new Date(tour.period_end);
    return from.getFullYear() + "-" + to.getFullYear();
  }

  turnicateText(text: string) {
    const regexp = /(<([^>]+)>)/gi;
    const strippedText = text.replace(regexp, "");
    return strippedText.substring(0, this.excerptLength)+"...";
  }
}
