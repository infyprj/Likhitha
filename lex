login.component.ts

import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
//import { UserService } from '../quickKart-services/user-service/user.service';
import { UserService } from '../services/user-service/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  status: string = "";
  errorMsg: string = "";
  msg: string = "";
  showDiv: boolean = false;
  constructor(private _userService: UserService) { }
  submitLoginForm(form: NgForm) {
    this._userService.validateCredentials(form.value.email, form.value.password).subscribe(
      responseLoginStatus => {
        this.status = responseLoginStatus;
        this.showDiv = true;
        if (this.status.toLowerCase() != "invalid credentials") {
          this.msg = "Login Successful";
        }
        else {
          this.msg = this.status + ". Try again with valid credentials.";
        }
      },
      responseLoginError => {
        this.errorMsg = responseLoginError;
      },
      () => console.log("SubmitLoginForm method executed successfully")
    );
  }
  ngOnInit() {
  }
}

user service.ts

import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { Iuser } from '../../interfaces/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  //private baseUrl = 'https://localhost:7195/api/User/AuthenticateUser';

  constructor(private http: HttpClient) { }

  //validateCredentials(email: string, password: string): Observable<any> {
  //  const body = { Email: email, PasswordHash: password };
  //  return this.http.post('https://localhost:7195/api/User/AuthenticateUser', body);
  //}


  validateCredentials(id: string, password: string): Observable<string> {
     // Format as 'YYYY-MM-DD'
    var userObj: Iuser = {
      email: id,
      passwordHash: password,
      firstName: "",
      lastName: "",
      phoneNumber: "",
      address: "",
      city: "",
      state: "",
      postalCode: "",
      country: "",
      roleId: 0   
    };
    return this.http.post<string>('https://localhost:7195/api/User/AuthenticateUser', userObj).pipe(catchError(this.errorHandler));
  }

  registerUser(user: Iuser): Observable<Iuser> {
    return this.http.post<Iuser>('https://localhost:7195/api/User/RegisterUser', user).pipe(catchError(this.errorHandler));
  }

  errorHandler(error: HttpErrorResponse) {
    console.log(error);
    return throwError(error.message || 'ERROR');
  }


  logout(): void {
    localStorage.removeItem("userId");
    localStorage.removeItem("userName");
    localStorage.removeItem("userRole");
  }

  isLoggedIn(): boolean {
    return localStorage.getItem("userId") != null;
  }
}
=======================
login.component.html

<app-common-layout></app-common-layout>
<div class="myContent">
  <div class="container">
    <form #loginForm="ngForm" (ngSubmit)="submitLoginForm(loginForm)" style="background-color:beige;">
      <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
          <h2 style="text-align:center">Login</h2>
          <h6 style="text-align:right;color:dimgrey;font-size:small">All fields are mandatory</h6>
          <div class="form-group">
            <div class="col" style="text-align:left">
              <label>Email Id</label>
            </div>
            <div class="col; input-group">
              <input type="email" name="email" #emailRef="ngModel" class="form-control" ngModel required pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$">
            </div>
            <div *ngIf="emailRef.errors && (emailRef.dirty || emailRef.touched)" style="text-align:left; padding-top:5px; color:red;">
              <div [hidden]="!emailRef?.errors?.['required']">
                <p>&nbsp;Email id is mandatory</p>
              </div>
              <div [hidden]="!emailRef?.errors?.['pattern']">
                <p>&nbsp;Email id is not entered in proper format</p>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col" style="text-align:left">
              <label>Password</label>
            </div>
            <div class="col; input-group">
              <input type="password" name="password" #passwordRef="ngModel" class="form-control" ngModel required>
            </div>
            <div *ngIf="passwordRef.errors && (passwordRef.dirty || passwordRef.touched)" style="text-align:left; padding-top:5px; color:red;">
              <div [hidden]="!passwordRef?.errors?.['required']">
                <p>&nbsp;Password is mandatory</p>
              </div>
            </div>
          </div>
          <div class="form-group" style="text-align:left">
            <button type="submit" [disabled]="!loginForm.form.valid" class="btn">Login</button>
          </div>
        </div>
        <div class="col-md-4">
        </div>
      </div>
      <div *ngIf="showDiv" style="color:red;text-align:center;">
        <br />
        {{msg}}
      </div>
    </form>
  </div>
</div>
