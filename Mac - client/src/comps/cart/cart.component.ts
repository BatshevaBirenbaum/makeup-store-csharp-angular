import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { products } from '../../classes/Product';
import { FormsModule } from '@angular/forms';
import { ChangColorDirective } from '../../app/change-color.directive';
import { Router } from '@angular/router';
import { PurchaseService } from '../../services/purchase.service';
import { CustomerService } from '../../services/customer.service';
import { purchase } from '../../classes/Purchase';
import { purchaseDetails } from '../../classes/purchaseDetails';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [FormsModule, ChangColorDirective],
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  @Input() buttonState: number = 1;//סטטוס לכפתור בשביל הצגת מלל שונה לפי סטטוס 
  @Output() alertEvent = new EventEmitter<void>();
  countInCart: number = 0;//כמות המוצרים בסל
  newPrice: number = 0;//מחיר מתעדכן
  cart: { product: products; quantity: number }[] = []; 
  cusMonth:string ="";//חודש להמרה

  constructor(private CartService: CartService, private router: Router,public cus:CustomerService) { }

  ngOnInit() {
    this.cart = this.CartService.getCart();
    this.newPrice = this.CartService.getTotalPrice();
    this.CartService.priceUpdated.subscribe((price) => {
    this.newPrice = price;
    });
  }
  emitAlert() {
    this.alertEvent.emit();
  }
  //מחיקה מהסל
  delete(id: number | undefined, price: number, quantity: number) {
    this.cart = this.cart.filter(item => item.product.productId !== id);
    this.CartService.setCart(this.cart);
    this.CartService.setCount(this.CartService.getCount() - 1);
    this.CartService.setTotalPrice(this.CartService.getTotalPrice() - (price * quantity));
  }
 //עדכון הסל
  EditPrice(id: number | undefined, price: number, currentQuantity: number) {
    const thisProduct = this.cart.find(item => item.product.productId === id);
    if (thisProduct) {
      const previousQuantity = thisProduct.quantity;
      if (currentQuantity > previousQuantity) {
        this.CartService.setTotalPrice(this.CartService.getTotalPrice() + price);
      } else {
        this.CartService.setTotalPrice(this.CartService.getTotalPrice() - price);
      }
      thisProduct.quantity = currentQuantity;
    }
  }
  //מעבר  לתשלום
  handleButtonClick() {
   console.log(this.buttonState)
   //אם סטטוס הכפתור הוא 1 - זה נמצא בדיב נפתח
   if (this.buttonState == 1) {
    //לא מנתב לדף אם המשתמש שלא מחובר
    if (this.cus.getCurrentCustomer() == null) {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "עלייך להתחבר / להירשם",
      });
    }
    else{
      this.navigateToOrder();
    }
}
    // סוגר את הדיב של הסל
    this.CartService.isCartOpen=false;
  }
  //מעדכן את הסטטוס
  //שזה אומר שהוא נמצא בשלב השני של התשלום
  //מנותב לפרטי הזמנה
  navigateToOrder() {
    this.buttonState = 2; 
    this.router.navigate(['/order-details']);
  }
  }
