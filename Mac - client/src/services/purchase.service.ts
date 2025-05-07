import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, firstValueFrom } from 'rxjs';
import { purchase } from '../classes/Purchase';
import { map } from 'rxjs/operators';
import { purchaseDetails } from '../classes/purchaseDetails';


@Injectable({
  providedIn: 'root'
})
export class PurchaseService {

  constructor(public http:HttpClient) { }
 //קריאת שרת להוספת קנייה
  add(purchase: purchase): Observable<purchase> {
    return this.http.post<purchase>('https://localhost:7166/api/Purchases', purchase);
  }
   //קריאת שרת להוספת פרטי קנייה
   async addPurchaseDetails(pd: purchaseDetails): Promise<purchaseDetails> {
    return await firstValueFrom(this.http.post<purchaseDetails>('https://localhost:7166/api/PurchasesDetails/details', pd));
  }
}
