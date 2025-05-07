import { Component, OnInit, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { Router } from '@angular/router';
import { ButtonComponent } from '../button/button.component';
import { CartService } from '../../services/cart.service';
import { CommonModule, Location } from '@angular/common';
import { products } from '../../classes/Product';
import { CartComponent } from '../cart/cart.component';

@Component({
  selector: 'app-more-details',
  standalone: true,
  imports: [ButtonComponent,CommonModule,CartComponent],
  templateUrl: './more-details.component.html',
  styleUrl: './more-details.component.css'
})
export class MoreDetailsComponent implements OnInit  {
  constructor(private router: Router,private cartService:CartService,public location:Location) { }
  cart: { product: products; quantity: number }[] = []; 
  product:any;
  count:number = 0;
  isButtonDisabled:boolean = false;
  ngOnInit() {
    // קבלת האובייקט שהועבר דרך state
    this.product = history.state.product;
    this.count = this.product.stockQuantity
    console.log("count:", this.count); 
    if(this.count===0)
    this.isButtonDisabled = true;
   
    console.log("Button Disabled:", this.isButtonDisabled); 
    if (!this.product) {
      console.error('No product received!');
      this.router.navigate(['/']);
    }
    console.log("pro",this.product)

  }
  addToCart () {
      // הוספת המוצר לסל
      this.cartService.addToCart(this.product,1);
      this.cart = this.cartService.getCart();
      console.log("cart",this.cart);
  }
  //חוזר אינטקציה אחת אחורה
  back(){
    this.location.back();  
  }

}
