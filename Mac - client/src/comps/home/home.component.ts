import { isPlatformBrowser } from '@angular/common';
import { Component, OnInit, OnDestroy, Inject, PLATFORM_ID } from '@angular/core';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'] // שים לב לתיקון מ-styleUrl ל-styleUrls
})
export class HomeComponent implements OnInit {
  home2: string = 'home2.PNG';
  home5: string = 'home5.PNG';
  home6: string = 'home6.PNG';
  home8: string = 'home8.PNG';
  images: string[] = [
    'pic1.webp',
    'pic2.webp',
    'pic3.webp'
  ];
  currentIndex: number = 0;
  intervalId: any;
  constructor(@Inject(PLATFORM_ID) private platformId: any) {}

  ngOnInit() {
    // מוודא שהקוד הזה רץ רק בדפדפן
    //פונקציה זו מחזירה את התמונה הנוכחית מתוך מערך התמונות על פי currentIndex.
    if (isPlatformBrowser(this.platformId)) {
      this.intervalId = setInterval(() => {
        this.currentIndex = (this.currentIndex + 1) % this.images.length;
      }, 1000);
    }
  }
  ngOnDestroy() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  getCurrentImage(): string {
    return this.images[this.currentIndex];
  }
}
