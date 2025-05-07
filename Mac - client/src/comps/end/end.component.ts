import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-end',
  templateUrl: './end.component.html',
  styleUrls: ['./end.component.css']
})
export class EndComponent implements OnInit {
  price: string="";

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    //מקבל את המחיר מהניתוב
    //המחיר הוא המחיר המעודכן לאחר הנחה אם יש
    this.route.params.subscribe(params => {
      this.price = params['price'];
      console.log(params)
   
    });
  }
}
