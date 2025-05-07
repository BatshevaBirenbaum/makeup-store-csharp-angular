import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormsModule, ReactiveFormsModule } from '@angular/forms'; // היבוא הנכון
import { CustomerService } from '../../services/customer.service';
import { ButtonComponent } from '../button/button.component';
import { CommonModule } from '@angular/common';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ButtonComponent,FormsModule,ReactiveFormsModule,CommonModule ],// כלול את ButtonComponent בלבד כאן
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm!: FormGroup;  // הגדרת FormGroup חדש

  constructor(public cus: CustomerService) {}

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      Name: new FormControl('', [Validators.required]),  // וידוא שהשם לא ריק
      Email: new FormControl('', [Validators.required, Validators.email]),  // וידוא שהאימייל נכון
    });
  }

  login() {
    if (this.loginForm.valid) {
      const { Name, Email } = this.loginForm.value;  // שליפת שם ואימייל

      // שליחה לשרת לבדוק אם המשתמש קיים עם השם והאימייל
      this.cus.getByEmail(Email).subscribe(
        (d) => {
          if (d) {
            this.cus.setCurrentCustomer(d);
            Swal.fire({
              title: "התחברת בהצלחה",
              icon: "success",
              draggable: true
            });
            
          }
           else {
            Swal.fire({
              icon: "error",
              title: "...אופס",
              text: "לא נמצא משתמש עם אימייל זה",
              
            });
          }
        },
        (error) => {
          console.log("Error: ", error);
          Swal.fire({
            icon: "error",
            title: "...אופס",
            text: "אירעה שגיאה. נסה שנית",
          });
        }
      );
    } else {
      Swal.fire({
        icon: "error",
        title: "...אופס",
        text: "נא להזין שם ואימייל תקינים",
        
      });
    }
  }
}
