import { Component, OnInit, ElementRef, ViewChild, Input, Output, EventEmitter } from '@angular/core';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { FormControl } from '@angular/forms';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';
import { Observable, startWith, map, of, mergeAll, debounce, interval } from 'rxjs';
import { MatChipInputEvent } from '@angular/material/chips';
import { Tag, TagsService } from 'src/app/tags/tags.service';

@Component({
  selector: 'app-chips-field',
  templateUrl: './chips-field.component.html',
  styleUrls: ['./chips-field.component.less']
})
export class ChipsFieldComponent implements OnInit {

  separatorKeysCodes: number[] = [ENTER, COMMA];
  tagCtrl = new FormControl('');
  filteredTags: Observable<Array<Tag>>;
  allTags: Array<Tag> = [];
  @Input() tags: Array<Tag> = [];
  @Input() allowToAddTag = false;
  @Output() onChange = new EventEmitter<any>();

  @ViewChild('tagInput') tagInput: ElementRef<HTMLInputElement> | undefined;


  constructor(private tagsService: TagsService) {
    this.filteredTags = this.tagCtrl.valueChanges.pipe(
      startWith(null),
      debounce(() => interval(500)),
      map((tag: string | null) => this._filter(tag)),
      mergeAll()
    );
  }

  ngOnInit(): void {
    this.tagsService.getTags().subscribe(tags => {
      this.allTags = tags;
    })
  }

  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();
    if (value) {
      this.tagsService.geTagByName(value).subscribe({
        next: (tag: Tag)=>{
          this.tags.push(tag);
        },
        error: err=>{
          console.log("Error", err);
          if (!this.allowToAddTag) return;
          this.tagsService.createTag({name: value}).subscribe(newTag => {
            this.tags.push(newTag);
          });
        }
      });
    }
    // Clear the input value
    event.chipInput!.clear();
    this.tagCtrl.setValue(null);
    this.onChange.emit(this.tags);
  }

  remove(tagToRemove: Tag): void {
    const index = this.tags.indexOf(tagToRemove);

    if (index >= 0) {
      this.tags.splice(index, 1);
    }
    this.onChange.emit(this.tags);
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.tags.push(event.option.value);
    this.tagInput!.nativeElement.value = '';
    this.tagCtrl.setValue(null);
  }

  private _filter(value: string | null): Observable<Array<Tag>> {
    if (!value) return of(this.allTags) ;
    const filterValue = value.toLowerCase();
    //return this.allTags.filter(tag => tag.toLowerCase().includes(filterValue));
    return this.tagsService.geTagsLike(filterValue);
  }

}
