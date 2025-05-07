import { Component, Input, Output } from '@angular/core';
import { EventEmitter } from 'stream';

@Component({
  selector: 'app-button',
  standalone: true,
  imports: [],
  templateUrl: './button.component.html',
  styleUrl: './button.component.css'
})
//קומפוננטת בן
//מבנה מסוים של כפתור עם אייקון
export class ButtonComponent {
    @Input() icon: string|undefined
    @Input() word: string|undefined
    @Input() class: string|undefined
    @Input() disabled: boolean = false; 

    }
    
