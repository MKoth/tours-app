import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Tour } from 'src/app/tours/tour.service';
import { Post, PostService } from '../post.service';

let map:google.maps.Map;

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.less']
})
export class PostComponent implements OnInit {
  postId: number = 0;
  post: Post | null = null;
  isLoading:boolean = false;
  isError:boolean = false;
  excerptLength = 300;
  prevPostId = 0;
  nextPostId = 0;

  constructor(
    private postService: PostService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.isLoading = true;
    this.postService.getPostById(parseInt(id as string)).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.post = result;
        this.initMap();
        this.postService.findPost("tour:"+(this.post?.tour as Tour).id).subscribe(res=>{
          const posts = (res as Post[]);
          const postIndex = posts.findIndex(p=>p.id==parseInt(id as string));
          if (postIndex!==0) this.prevPostId = posts[postIndex-1].id as number;
          if (postIndex!==posts.length-1) this.nextPostId = posts[postIndex+1].id as number;
        });
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

  initMap() {
    let pointLatLng = this.post?.point.split(",").map(coord=>parseFloat(coord));
    let mapProp = {
      center: new google.maps.LatLng((pointLatLng as number[])[0], (pointLatLng as number[])[1]),
      zoom: 3,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
    };
    map = new google.maps.Map(document.getElementById("googleMapPost") as HTMLElement, mapProp);
    
    new google.maps.Marker({
      position: new google.maps.LatLng((pointLatLng as number[])[0], (pointLatLng as number[])[1]),
      map,
      title: "",
    });
  }

  getDateRange(post: Post) {
    let from = new Date(post.period_start);
    let to = new Date(post.period_end);
    return from.getFullYear + "-" + to.getFullYear;
  }

  turnicateText(text: string) {
    return text.substring(0, this.excerptLength)+"...";
  }

}
