import { RouterLink, RouterModule, Routes } from '@angular/router';
import { HomeComponent } from '../comps/home/home.component';
import { LoginComponent } from '../comps/login/login.component';
import { SignupComponent } from '../comps/signup/signup.component';
import { NgModule } from '@angular/core';
import { ProductsComponent } from '../comps/products/products.component';
import { MoreDetailsComponent } from '../comps/more-details/more-details.component';
import { CartComponent } from '../comps/cart/cart.component';
import { OrderDetailsComponent } from '../comps/order-details/order-details.component';
import { EndComponent } from '../comps/end/end.component';

export const routes: Routes = [
    { path: '', component: HomeComponent }, 
    { path: 'login', component: LoginComponent },
    { path: 'signup', component: SignupComponent },
    { path: 'products/:id', component: ProductsComponent },
    { path: 'product-details', component: MoreDetailsComponent },
    { path: 'cart', component: CartComponent },
    { path: 'order-details', component: OrderDetailsComponent },
    { path: 'end', component: EndComponent}

];
@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule,RouterLink]
  })
  export class AppRoutingModule { }
