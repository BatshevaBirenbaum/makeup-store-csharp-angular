import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { products } from '../classes/Product';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor() { }
  cartUpdated: Subject<void> = new Subject<void>();
  countUpdated: Subject<number> = new Subject<number>();
  priceUpdated: Subject<number> = new Subject<number>();
  countInCart: number =0;
  TotalPrice: number =0
  public cart: { product: products; quantity: number }[] = [];
  isCartOpen: boolean = false;  // משתנה לעקוב אחרי מצב הסל (פתוח/סגור)
  isForm: boolean = false;

  //הוספת מוצר וכמות לסל
  addToCart(  product: products, quantity: number) {
    //אם המוצר כבר קיים בסל , רק הכמות מתעדכנת
    const existingProductIndex = this.cart.findIndex(item => item.product.productId === product.productId);   
    if (existingProductIndex!=-1) {
      this.cart[existingProductIndex].quantity += quantity;  
      } 
      else {
      this.cart.push({ product, quantity });
      this.countInCart=this.countInCart+1;
     }
     //עדכון מחיר לפי כמות
     this.TotalPrice = this.cart.reduce((total, item) => {
      const price = item.product.price ?? 0; 
      return total + (price * item.quantity);
    }, 0); 
    this.cartUpdated.next();
    this.countUpdated.next(this.countInCart);
  }
getCart() {
  return this.cart;
}
setCart(cart: any|undefined) {
 this.cart = cart;
}
getCount(){
  return this.countInCart
}
setCount(count: number)
{
  this.countInCart = count;
  this.countUpdated.next(this.countInCart);
}
setTotalPrice(price: number){
  this.TotalPrice = price;
  this.priceUpdated.next(this.TotalPrice);
}
getTotalPrice() {
  return this.TotalPrice;
}
 // פונקציה לסגור את הסל
closeCart(){  
  this.isCartOpen = false;  // עדכון מצב הסל
}
// פונקציה לפתיחת הסל
openCart() {
  this.isCartOpen = true;  // עדכון מצב הסל
}
//פומקציה לאיפוס הסל
resetCart() {
  this.cart = [];
  this.countInCart = 0;
  this.TotalPrice = 0;
  this.cartUpdated.next();
  this.countUpdated.next(this.countInCart);
  this.priceUpdated.next(this.TotalPrice);
}
}
