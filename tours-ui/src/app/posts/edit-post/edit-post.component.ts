import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { Layer } from 'src/app/layers/layer.service';
import { Tour } from 'src/app/tours/tour.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Post, PostService } from '../post.service';
import { EditPostFormComponent } from './edit-post-form/edit-post-form.component';
import { EditPostMapComponent } from './edit-post-map/edit-post-map.component';

@Component({
  selector: 'app-edit-post',
  templateUrl: './edit-post.component.html',
  styleUrls: ['./edit-post.component.less']
})
export class EditPostComponent implements OnInit {

  @ViewChild(EditPostFormComponent) formComponent!: EditPostFormComponent;
  @ViewChild(EditPostMapComponent) mapComponent!: EditPostMapComponent;

  formErrorMessage = "";
  isLoading = true;
  isError = false;
  post: Post = {
    name: "",
    text: "",
    image: "",
    point: "",
    period_start: 0,
    period_end: 0,
    creator_id: "",
    city: {id:-1, name:"No city available, create one!", point:""},
    tags: [],
    layer: {},
    tour: {},
    ordering: 0
  }
  
  constructor(
    private route: ActivatedRoute,
    private authService: AuthService,
    private postService: PostService,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.isLoading = true;
    this.postService.getPostById(parseInt(id as string)).subscribe({
      next: result => {
        this.isLoading = false;
        this.isError = false;
        this.post = result;
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

  onSubmit() {
    this.formErrorMessage = "";
    const postForm = this.formComponent.postForm;
    const tour = this.formComponent.tour as Tour;
    if(postForm.invalid) {
      this.formErrorMessage = "Please fill in all required fields!";
      return;
    }
    const point = this.mapComponent.point;
    if (!point) {
      this.formErrorMessage = "Post should have point on map!";
      return;
    }
    this.post.tags = this.formComponent.tags;
    this.post.image = postForm.get("image")?.value;
    this.post.name = postForm.get("name")?.value;
    this.post.text = postForm.get("text")?.value;
    this.post.period_start = postForm.get("period_start")?.value;
    this.post.period_end = postForm.get("period_end")?.value;

    this.isError = false;
    this.isLoading = true;
    console.log("Updated post", this.post);

    this.postService.createPost(this.post).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.post = result;
        this.router.navigate(["/posts/"+this.post.id]);
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

}
