import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { products } from '../classes/Product';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {

  constructor(public http:HttpClient) { }
  //קריאת שרת להחזרת כל המוצרים עם קוד הקטגוריה שהתקבל
  getProductsById(id:number): Observable <Array<products>>
  {
    return this.http.get<Array<products>>(`https://localhost:7166/api/Products/${id}`)
  }
  //שמירת המערך של המוצרים לפי הקטגןריה שנבחרה
  allProductsByThisCatefory: Array<products> | null = null; 

  setArrayProducts(ArrayProducts:  Array<products>) {
    this.allProductsByThisCatefory = ArrayProducts; 
  }
  getArrayProducts():  Array<products> | null {
    return this.allProductsByThisCatefory; 
  }
}
