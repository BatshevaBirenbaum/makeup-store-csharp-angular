import { Component, NgModule, OnInit } from '@angular/core';

import { RouterLink, RouterOutlet } from '@angular/router';
import { CategoryService } from '../services/category.service';
import { Category } from '../classes/Category';
import { CartService } from '../services/cart.service';
import { CommonModule } from '@angular/common';
import { products } from '../classes/Product';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from '../comps/login/login.component';
import { SignupComponent } from '../comps/signup/signup.component';
import { CustomerService } from '../services/customer.service';
import { CartComponent } from '../comps/cart/cart.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,RouterLink,CommonModule,FormsModule,LoginComponent,SignupComponent,CartComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit{
  logo: string = 'logo.png';
 
  title = 'Project';
  countInCart: number =0;
  isCartOpen: boolean = false;
  isLoginOpen:boolean = false;
  currentComponent = 'login'; 
  isAuth: boolean = false;
  cart: { product: products; quantity: number }[] = []; 

  constructor(public catC:CategoryService,public cartService:CartService,public customerService:CustomerService){}
  ngOnInit() : void{
   
    this.get()
    this.cart = this.cartService.getCart();
    this.countInCart = this.cartService.getCount()
    this.cartService.cartUpdated.subscribe(() => {
      this.updateCountInCart();
    });
    this.cartService.countUpdated.subscribe((count) => {
      this.countInCart = count;
  });
 }
 allCat:Array<Category> = new Array<Category>();
 
 get(){
  this.catC.getC().subscribe(
    d=>{
      this.allCat=d;
      console.log(this.allCat)
    },
    err=>{console.log("error"+err.message)}
  )
  console.log("סןף הפונקציה")
 }
//עדכון כמות מוצרים בסל
 updateCountInCart() {
  this.countInCart = this.cartService.getCount()
}

openCart() {
  this.cartService.isCartOpen=true;
}
openLogin(){
  this.isLoginOpen = true;
}

closeCart() {
  this.cartService.isCartOpen=false;
}

closeLogin() {
  this.isLoginOpen = false;
}
openSignup() {
  this.currentComponent = 'signup'; // שינוי לקומפוננטת הרשמה
}
openLogincomp(){
  this.currentComponent = 'login'; 
}
}
