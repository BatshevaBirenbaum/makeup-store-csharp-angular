import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Customer } from '../classes/Customer';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  constructor(public http:HttpClient) { }
  //קריאת שרת להוספת משתמש חדש
  add(c:Customer): Observable<Customer>
  {
    return this.http.post<Customer>('https://localhost:7166/api/Customers/',c)
  }
  //קריאת שרת לבדיקה האם קיים משתמש עם המייל שהתקבל
  getByEmail(email:string): Observable<Customer>{
    return this.http.get<Customer>(`https://localhost:7166/api/Customers/${email}`);
  }
  currentCustomer: Customer | null = null; // המשתמש הנוכחי
 
  setCurrentCustomer(customer: Customer) {
    this.currentCustomer = customer; // שמירת המשתמש הנוכחי
  }
  getCurrentCustomer(): Customer | null {
    return this.currentCustomer; // החזרת המשתמש הנוכחי
  }
}
