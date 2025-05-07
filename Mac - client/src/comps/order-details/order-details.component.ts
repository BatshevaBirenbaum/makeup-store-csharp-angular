import { Component, OnInit } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { firstValueFrom, from } from 'rxjs';
import { FormsModule } from '@angular/forms';
import { CartComponent } from '../cart/cart.component';
import { CommonModule } from '@angular/common';
import { CustomerService } from '../../services/customer.service';
import { PurchaseService } from '../../services/purchase.service';
import { purchase } from '../../classes/Purchase';
import { purchaseDetails } from '../../classes/purchaseDetails';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-order-details',
  standalone: true,
  imports: [FormsModule,CartComponent,CommonModule],
  templateUrl: './order-details.component.html',
  styleUrl: './order-details.component.css'
})
export class OrderDetailsComponent  implements OnInit{
  cart: { product: any; quantity: number }[] = [];
  totalPrice: number = 0;
  showForm: boolean = false; // משתנה שמחליט אם להראות את הטופס או לא
  newPurchase:purchase=new purchase()
  newPurchaseDetails: purchaseDetails=new purchaseDetails()
  birthDay: boolean = false
  isPurchase:boolean = false
  isPurchaseDetails:boolean = false
  price: number = 0
  purchasIdToDetails:number=0;
  isFillForm:boolean = false;

  constructor(public cartService: CartService,private cus: CustomerService,private pur:PurchaseService,private router: Router) {}

  ngOnInit(): void {
    this.cart = this.cartService.getCart();
    this.totalPrice = this.cartService.getTotalPrice();
    this.cartService.cartUpdated.subscribe(() => {
    this.cart = this.cartService.getCart();
    this.totalPrice = this.cartService.getTotalPrice();
    });
  }
  fillForm(){
    this.isFillForm=true
  }
  addPurchase(){
    if(this.isFillForm==true)
      this.addPurchase2();
    else{
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text:"לא מילאת את כל הפרטים"
      });
    }


  }
//הוספת קניה ופרטי קניה
async addPurchase2() {
  try {
    console.log('Toggle form:', this.showForm);
    this.showForm = !this.showForm;

    const currentCustomer = this.cus.getCurrentCustomer();
    const birthDate = currentCustomer?.birthDate;

    if (birthDate) {
      const date = new Date(birthDate);
      const month = date.getMonth() + 1;
      this.newPurchase.monthBirth = month < 10 ? `0${month}` : `${month}`;
    }

    this.newPurchase.customerId = currentCustomer?.customerId;
    this.newPurchase.priceBeforeBD = this.cartService.getTotalPrice();

    // שליחה לשרת להוספת קנייה
    const p = await firstValueFrom(this.pur.add(this.newPurchase));
    this.isPurchase = true;

    if (p.purchaseId) {
      this.purchasIdToDetails = p.purchaseId;
      this.newPurchaseDetails.purchaseId = this.purchasIdToDetails;
    }

    console.log('Purchase:', p);
    const priceAfter = p.priceBeforeBD;
    if (priceAfter) {
      this.price = priceAfter;
      const priceBefore = this.cartService.getTotalPrice();
      if (priceBefore > priceAfter) {
        this.birthDay = true;
        this.cartService.setTotalPrice(priceAfter);
      }
    }

    this.newPurchase = new purchase();

    this.newPurchaseDetails.puchaseDetailsList = this.cartService.getCart();
    console.log("newPurchaseDetails", this.newPurchaseDetails);

    // שליחת אובייקט לשרת להוספת פרטי קנייה
    const pd: purchaseDetails = await this.pur.addPurchaseDetails(this.newPurchaseDetails);
    this.isPurchaseDetails = true;
    console.log("Purchase Details", pd);

    // אם 2 הפעולות הצליחו
    if (this.isPurchase && this.isPurchaseDetails) {
      this.cartService.resetCart();

      if (this.birthDay) {
        Swal.fire({
          title: 'יום הולדת שמח!🎂 🎉',
          text: 'אנו מאחלים לך יום מלא אושר והפתעות!',
          imageWidth: 100,
          imageHeight: 100,
          confirmButtonText: 'תודה!',
          background: '#fffbe6',
          confirmButtonColor: 'pink',
        });
      }

      this.router.navigate(['/end', { price: this.price }]);
    }
  } catch (error) {
    console.error("Error during purchase:", error);
    
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: this.cus.getCurrentCustomer() == null
        ? "עלייך להתחבר / להירשם"
        : "אירעה שגיאה בעת שמירת ההזמנה",
    });
  }
}
}