import { Component, OnInit } from '@angular/core';
declare let tinymce: any;

@Component({
  selector: 'app-text-editor',
  templateUrl: './text-editor.component.html',
  styleUrls: ['./text-editor.component.less']
})
export class TextEditorComponent implements OnInit {

  tinymceInit: any;

  constructor() {
    this.tinymceInit = { 
      plugins: 'lists link image table code help wordcount',
      toolbar: 'image',
      image_advtab: true,
      file_picker_callback: function(cb: any, value: any, meta: any) {
        let input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('accept', 'image/*');
      
        input.onchange = function () {
          var file = input.files![0];
          var reader = new FileReader();
          reader.onload = function () {
            var id = 'blobid' + (new Date()).getTime();
            var blobCache = tinymce.activeEditor.editorUpload.blobCache;
            var base64 = (reader.result as string).split(',')[1];
            var blobInfo = blobCache.create(id, file, base64);
            blobCache.add(blobInfo);
            cb(blobInfo.blobUri(), { title: file.name });
          };
          reader.readAsDataURL(file);
        };
      
        input.click();
      }
    };
  }

  ngOnInit(): void {
  }

}
