import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidatorFn, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/profile/user.service';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.less']
})
export class RegistrationComponent implements OnInit {

  isSubmitted = false;

  isLoading = false;
  isError = false;
  isSuccess = false;

  pageText = "Submitting new user, please wait...";

  contactForm: FormGroup;

  constructor(private fb: FormBuilder, private router: Router,
    private authService: AuthService, private userService: UserService) {
    this.contactForm = this.fb.group({
      userName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(15)]],
      emailId: ['', [Validators.required, Validators.email]],
      firstName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(15)]],
      lastName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(15)]],
      password: ['', [Validators.required, Validators.minLength(5)]],
      confirmPassword: ["",Validators.required]
    });
    this.contactForm.addValidators(
      RegistrationComponent.matchValidator(this.contactForm)
    );
  }

  ngOnInit(): void {}

  get userName() {
    return this.contactForm.get('userName');
  }

  get emailId() {
    return this.contactForm.get('emailId');
  }

  get firstName() {
    return this.contactForm.get('firstName');
  }
 
  get lastName() {
    return this.contactForm.get('lastName');
  }

  get password() {
    return this.contactForm.get('password');
  }

  get confirmPassword() {
    return this.contactForm.get('confirmPassword');
  }

  goToHomePage() {
    this.router.navigate(['home']);
  }

  goToLoginPage() {
    this.authService.redirectForLogin();
  }

  onSubmit() {
    if(this.contactForm.status !== "VALID")
      return;
    this.isSubmitted = true;
    this.contactForm.disable();
    this.isLoading = true;
    this.userService.registerNewUser(this.contactForm.value).subscribe({
      next: (data) => {
        console.log("data", data);
      },
      error: (error) => {
        console.log("error", error);
        this.isLoading = false;
        this.isError = true;
        this.isSuccess = false;
        this.pageText = 'Error happened while attempting to Register new User, please try again later!';
      },
      complete: () => {
        console.log("complete");
        this.isLoading = false;
        this.isError = false;
        this.isSuccess = true;
        this.pageText = 'User successfully registeredf, please proceed to login page!';
      }
    });
  }

  public static matchValidator(contactForm: FormGroup): ValidatorFn {
    return () => {
      if (contactForm.get('password')?.value != contactForm.get('confirmPassword')?.value)
        return {error:'password mismatch'}
      return null;
    }
  }
}
