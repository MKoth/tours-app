import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { Post } from 'src/app/posts/post.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Tour, TourService } from '../tour.service';
import { EditToursFormComponent } from './edit-tours-form/edit-tours-form.component';
import { EditToursMapComponent } from './edit-tours-map/edit-tours-map.component';

@Component({
  selector: 'app-edit-tours',
  templateUrl: './edit-tours.component.html',
  styleUrls: ['./edit-tours.component.less']
})
export class EditToursComponent implements OnInit {

  @ViewChild(EditToursFormComponent) formComponent!: EditToursFormComponent;
  @ViewChild(EditToursMapComponent) mapComponent!: EditToursMapComponent;

  formErrorMessage = "";
  isLoading = true;
  isError = false;

  tour: Tour = {
    name: "",
    text: "",
    image: "",
    period_start: 0,
    period_end: 0,
    creator_id: "",
    city: {id:-1, name:"No city available, create one!", point:""},
    tags: [],
    locations: [],
    duration: 0,
    layer:{}
  };

  constructor(
    private route: ActivatedRoute,
    private authService: AuthService,
    private tourService: TourService,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id == "new") {
      this.tour.creator_id = this.authService.getDecodedAccessToken().sub;
      this.isLoading = false;
    } else {
      this.isLoading = true;
      this.tourService.getTourById(parseInt(id as string)).subscribe({
        next: result=>{
          this.isLoading = false;
          this.isError = false;
          this.tour = result;
        },
        error: err=>{
          this.isLoading = false;
          this.isError = true;
          console.log("Error", err);
        }
      });
    }
  }

  onSubmit() {
    this.formErrorMessage = "";
    const tourForm = this.formComponent.tourForm;
    if(tourForm.invalid) {
      this.formErrorMessage = "Please fill in all required fields!";
      return;
    }
    const path = this.mapComponent.path;
    if (path.length<2) {
      this.formErrorMessage = "Map path should consist of at least 2 points!";
      return;
    }
    this.tour.city = this.formComponent.city as City;
    this.tour.tags = this.formComponent.tags;
    this.tour.image = tourForm.get("image")?.value;
    this.tour.name = tourForm.get("name")?.value;
    this.tour.text = tourForm.get("text")?.value;
    this.tour.period_start = tourForm.get("period_start")?.value;
    this.tour.period_end = tourForm.get("period_end")?.value;
    this.tour.layer = tourForm.get("layer")?.value;
    this.tour.duration = tourForm.get("duration")?.value;
    this.tour.locations = this.mapComponent.path.map((post:Post, index:number)=>this.insertDataIntoNewPost(post, index));

    this.isError = false;
    this.isLoading = true;

    this.tourService.createTour(this.tour).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.tour = result;
        this.router.navigate(["/tours/"+this.tour.id]);
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

  insertDataIntoNewPost(post: Post, index: number):Post {
    post.ordering = index;
    return post.id? post:{
      name: "Post for "+this.tour.name+" no. "+(post.ordering+1),
      text: "Sample text here!",
      image: "/assets/empty-post.jpeg",
      point: post.point,
      period_start: this.tour.period_start,
      period_end: this.tour.period_end,
      creator_id: this.tour.creator_id,
      city: this.tour.city,
      tags: this.tour.tags,
      layer: this.tour.layer,
      tour: this.tour,
      ordering: post.ordering
    };
  }

}
