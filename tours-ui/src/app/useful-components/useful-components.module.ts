import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChipsFieldComponent } from './chips-field/chips-field.component';
import { MaterialModule } from '../material/material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TextEditorComponent } from './text-editor/text-editor.component';
import { EditorModule } from '@tinymce/tinymce-angular';
import { SelectCreateCityComponent } from './select-create-city/select-create-city.component';
import { DialogsModule } from '../dialogs/dialogs.module';
import { SelectLayersListComponent } from './select-layers-list/select-layers-list.component';
import { FindTourByNameComponent } from './find-tour-by-name/find-tour-by-name.component';
import { AttachImageComponent } from './attach-image/attach-image.component';


@NgModule({
  declarations: [
    ChipsFieldComponent,
    TextEditorComponent,
    SelectCreateCityComponent,
    SelectLayersListComponent,
    FindTourByNameComponent,
    AttachImageComponent
  ],
  imports: [
    CommonModule,
    MaterialModule,
    ReactiveFormsModule,
    EditorModule,
    DialogsModule,
    FormsModule
  ],
  exports: [
    ChipsFieldComponent,
    TextEditorComponent,
    SelectCreateCityComponent,
    SelectLayersListComponent,
    FindTourByNameComponent,
    AttachImageComponent
  ]
})
export class UsefulComponentsModule { }
