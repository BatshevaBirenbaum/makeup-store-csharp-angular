import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Category } from '../classes/Category';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(public http:HttpClient) { }
  
  //קריאת שרת לקבלת כל הקטגוריות
  getC():Observable<Array<Category>> {
    return this.http.get<Array<Category>>('https://localhost:7166/api/Categories')
  }
  }