import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChipsFieldComponent } from './chips-field/chips-field.component';
import { MaterialModule } from '../material/material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { TextEditorComponent } from './text-editor/text-editor.component';
import { EditorModule } from '@tinymce/tinymce-angular';
import { SelectCreateCityComponent } from './select-create-city/select-create-city.component';
import { DialogsModule } from '../dialogs/dialogs.module';


@NgModule({
  declarations: [
    ChipsFieldComponent,
    TextEditorComponent,
    SelectCreateCityComponent
  ],
  imports: [
    CommonModule,
    MaterialModule,
    ReactiveFormsModule,
    EditorModule,
    DialogsModule
  ]
})
export class UsefulComponentsModule { }
