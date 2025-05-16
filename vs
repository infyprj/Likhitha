login.component.ts

import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
//import { UserService } from '../services/user.service';
import { Router } from '@angular/router';
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

  constructor(private _userService: UserService, private router: Router) { }

  submitLoginForm(form: NgForm) {
    if (!form.valid) {
      this.errorMsg = "Form validation failed.";
      return;
    }

    this._userService.validateCredentials(form.value.email, form.value.password).subscribe(
      (response: any) => {
        if (response && response.userId) {
          this.status = "success";
          localStorage.setItem("userId", response.userId.toString());
          localStorage.setItem("userName", response.firstName);
          localStorage.setItem("userRole", response.roleName);
          this.router.navigate(['/dashboard']);
        } else {
          this.status = "Invalid credentials";
          this.showDiv = true;
          this.msg = "Invalid credentials. Try again.";
        }
      },
      (error) => {
        this.errorMsg = "Server error. Try again later.";
      },
      () => console.log("Login request completed.")
    );
  }

  ngOnInit(): void {
    this._userService.logout();
  }
}

<html>

<div class="container mt-4">
  <form #loginForm="ngForm" (ngSubmit)="submitLoginForm(loginForm)" class="card p-4 shadow">
    <h2 class="text-center mb-3">Login</h2>

    <div class="form-group mb-3">
      <label>Email</label>
      <input type="email" name="email" #emailRef="ngModel" ngModel required
             class="form-control" placeholder="Enter email">
      <div *ngIf="emailRef.errors && (emailRef.touched || emailRef.dirty)" class="text-danger">
        <div *ngIf="emailRef.errors['required']">Email is required</div>
        <div *ngIf="emailRef.errors['email']">Invalid email format</div>
      </div>
    </div>

    <div class="form-group mb-3">
      <label>Password</label>
      <input type="password" name="password" #passwordRef="ngModel" ngModel required
             class="form-control" placeholder="Enter password">
      <div *ngIf="passwordRef.errors && (passwordRef.touched || passwordRef.dirty)" class="text-danger">
        <div *ngIf="passwordRef.errors['required']">Password is required</div>
      </div>
    </div>

    <button type="submit" class="btn btn-primary w-100">Login</button>

    <div *ngIf="showDiv" class="alert alert-warning mt-3">{{ msg }}</div>
    <div *ngIf="errorMsg" class="alert alert-danger mt-3">{{ errorMsg }}</div>
  </form>
</div>

user service.ts

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private baseUrl = 'https://localhost:7195/api/User/AuthenticateUser';

  constructor(private http: HttpClient) { }

  validateCredentials(email: string, password: string): Observable<any> {
    const body = { email: email, password: password };
    return this.http.post(`https://localhost:7195/api/User/AuthenticateUser`,body);
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
