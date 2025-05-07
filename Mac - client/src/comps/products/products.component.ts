import { Component, OnInit } from '@angular/core';
import { ActivatedRoute,Router } from '@angular/router';
import { products } from '../../classes/Product';
import { ProductsService } from '../../services/products.service';
import { CardComponent } from '../card/card.component';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [CardComponent,FormsModule],
  templateUrl: './products.component.html',
  styleUrl: './products.component.css'
})
export class ProductsComponent implements OnInit {
 id!: number;
 sortBy:string=""
 

 products:Array<products> = new Array<products>();

  constructor(private route: ActivatedRoute,private router: Router, public ps : ProductsService) {}

  ngOnInit() {
    this.route.paramMap.subscribe((params) => {
      const idParams =params.get('id');
      this.id = Number(idParams);
      this.getProductsById(this.id)
    });
   }
   //קבלת id 
   //מהמוצר שנבחר ושלליחתו לפרטים נוספים
    getProductsById(id:number){
      if (!id) {
        console.error('Error: id is not defined');
        return;
      }
      this.ps.getProductsById(id).subscribe(
        arrProducts=>{
          this.products=arrProducts;
          this.ps.setArrayProducts(arrProducts)
          console.log(this.products)
        },
        err=>{console.log("error"+err.message)}
      )
      console.log("סןף הפונקציה")
     }
      //קבלת האובייקט
   //מהמוצר שנבחר ושליחתו לפרטים נוספים
     moreDetails(productId: object | undefined) {
      console.log("fff",productId)
      if (productId) {
        this.router.navigate(['/product-details'],
        {
          state: { product: productId } 
        } 
        ); 
      } else {
        console.error('Error: productId is undefined');
      }
    
    }
   
    //מיון המערך לפי מחיר
    sortPrice() {
      if (this.sortBy === 'low') {
        this.products = this.products.sort((a, b) => (a.price ?? 0) - (b.price ?? 0));
        console.log("sort",this.products)
      }
       else if (this.sortBy === 'high') {
        this.products = this.products.sort((a, b) => (b.price ?? 0) - (a.price ?? 0));
        console.log("sort",this.products)

      }
    }
 
}

