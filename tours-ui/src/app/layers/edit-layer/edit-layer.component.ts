import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { City } from 'src/app/useful-components/select-create-city/city.service';
import { Layer, LayerService } from '../layer.service';
import { EditLayerFormComponent } from './edit-layer-form/edit-layer-form.component';
import { EditLayerMapComponent } from './edit-layer-map/edit-layer-map.component';

@Component({
  selector: 'app-edit-layer',
  templateUrl: './edit-layer.component.html',
  styleUrls: ['./edit-layer.component.less']
})
export class EditLayerComponent implements OnInit {

  @ViewChild(EditLayerFormComponent) formComponent!: EditLayerFormComponent;
  @ViewChild(EditLayerMapComponent) mapComponent!: EditLayerMapComponent;
  
  formErrorMessage = "";
  isLoading = true;
  isError = false;
  cities: City[] = [];
  layer: Layer = {
    name: "",
    points: [],
    text: "",
    image: "",
    period_start: 0,
    period_end: 0,
    creator_id: "",
    city: {id:-1, name:"No city available, create one!", point:""},
    tags: [],
  };

  constructor(
    private route: ActivatedRoute,
    private authService: AuthService,
    private layerService: LayerService,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id == "new") {
      this.layer.creator_id = this.authService.getDecodedAccessToken().sub;
      this.isLoading = false;
    } else {
      this.isLoading = true;
      this.layerService.getLayerById(parseInt(id as string)).subscribe({
        next: result=>{
          this.isLoading = false;
          this.isError = false;
          this.layer = result;
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
    const layerForm = this.formComponent.layerForm;
    if(layerForm.invalid) {
      this.formErrorMessage = "Please fill in all required fields!";
      return;
    }
    const path = this.mapComponent.path;
    if (path.length<3 || path[0]!==path[path.length-1]) {
      this.formErrorMessage = "Map path should consist of at least 3 points and shape should be closed!";
      return;
    }
    this.layer.city = this.formComponent.city as City;
    this.layer.tags = this.formComponent.tags;
    this.layer.image = layerForm.get("image")?.value;
    this.layer.name = layerForm.get("name")?.value;
    this.layer.text = layerForm.get("text")?.value;
    this.layer.period_start = layerForm.get("period_start")?.value;
    this.layer.period_end = layerForm.get("period_end")?.value;
    this.layer.points = this.mapComponent.path;

    this.isError = false;
    this.isLoading = true;

    this.layerService.createLayer(this.layer).subscribe({
      next: result=>{
        this.isLoading = false;
        this.isError = false;
        this.layer = result;
        this.router.navigate(["/layers/"+this.layer.id]);
      },
      error: err=>{
        this.isLoading = false;
        this.isError = true;
        console.log("Error", err);
      }
    });
  }

}
