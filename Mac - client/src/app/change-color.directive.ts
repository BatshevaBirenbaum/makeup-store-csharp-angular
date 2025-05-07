import { Directive, ElementRef, HostListener, Input } from '@angular/core';
import { Router } from '@angular/router';

@Directive({
  selector: '[appChangColor]',
  standalone: true
})
export class ChangColorDirective {

  constructor(private er: ElementRef,private router: Router) {
    er.nativeElement.style.background='black'; 
  }
//שינוי צבע כפתור
  @HostListener('click')
  a()
  {
   this.er.nativeElement.style.background ='yellow';
  }

}
