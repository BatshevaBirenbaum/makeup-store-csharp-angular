import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, ReactiveFormsModule } from '@angular/forms'; // הייבוא הנכון
import { CustomerService } from '../../services/customer.service';
import { Customer } from '../../classes/Customer';
import { ButtonComponent } from '../button/button.component';
import Swal from 'sweetalert2';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-signup',
  standalone: true,
  imports: [ReactiveFormsModule,ButtonComponent,CommonModule],  // רק את ReactiveFormsModule כאן
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
  signupForm!: FormGroup;

  constructor(public cus: CustomerService) { }

  ngOnInit(): void {
    // הגדרת FormGroup עם Validators
    this.signupForm = new FormGroup({
      Name: new FormControl('', Validators.required),
      Phone: new FormControl('', [
        Validators.required, 
        Validators.pattern('^[0-9]{10}$') // וידוא שמספר הטלפון הוא בן 10 ספרות
      ]),
      Email: new FormControl('', [
        Validators.required, 
        Validators.email
      ]),
      BirthDate: new FormControl('', Validators.required)
    });
  }
  //הוספת משתמש חדש
  signup() {
    if (this.signupForm.valid) {
      const newCustomer: Customer = this.signupForm.value;
      //שולח לפונקציה שבservice את המשתמש הנוכחי
      this.cus.add(newCustomer).subscribe(d => {
        console.log("try");
        if (d) {
          this.cus.setCurrentCustomer(d);
          this.signupForm.reset(); // ריקון הטופס
          console.log(this.cus.getCurrentCustomer());
          Swal.fire({
            title: "נרשמת בהצלחה!",
            icon: "success",
            draggable: true
          });
        }
      }, error => {
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: "אימייל קיים, עלייך להתחבר",
        });
      });
    }
  }
}
