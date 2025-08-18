# Angular

### What is Angular?
- Angular is Typescript-based framework used for building single-page applications. 
- It follows a compoment based architecture, where each component controls part of the UI and its logic. 
- One of the main strengths is that allows updates to specific parts of the page without reloading the entire application.
- Since Angular is build on TS, its type safe and helps to catch errors early on.

---

### What are Angular hooks?
Hooks basically show the lifecycle of the components.  
There are three main hooks: 
- `ngOnInit` - Runs when the component is created and initialized
- `ngOnChange` - Runs when the input properties of a component changes. Angular compares the old and new values and re-rendes only the affected part.
- `ngOnDelete` - Runs just before the component is removed, useful for cleanup.

---

### Data Binding in Angular?
Data binding in Angular is the mechanism that connects the *component (TypeScript code)* with the *view (HTML template)*, allowing data to flow between them. There are four types of data binding in Angular:
1. Interpolation (`{{}}`)
- Used to display dynamic data from the component in the template.
``` ts
export class AppComponet {
    title = "Hello"
}
```

```html
<h1>{{title}}</h1>
```

2. Property Binding (`[]`) 
- One way from component to DOM Property
```ts
export class AppComponent {
  imgUrl = 'assests/cat.png';
}
```

```html
<img [src]="igmUrl" alt="Image">
```

3. Event Binding (`()`)
- One way from view to Components
```ts
export class AppComponent {
  greet() {
    alert('Hello!');
  }
}
```

```html
<button (click)="greet()">Click Me</button>
```

4. Two-way binding (`[()]`)
```ts
export class AppComponent {
  user = {username:'', password:''};
  
  onSubmit(form:any) {
    if(form.valid) {
        console.log("Form Submitted", form.value);
    } else {
        console.log("Form Invalid");
    }
  }
}
```

```html
<form #loginForm="ngForm" (ngSubmit)="onSubmit(loginForm)">
    <input type="text" name="username" [(ngModel)]="user.username" required>
    <input type="password" name="password" [(ngModel)]="user.password" required>
    <button type="submit" [disabled]="loginForm.invalid">Submit</button>
</form>
```

---

### What are components in Angular?
A component in Angular is basic building block of the User Interface.  
For creating a component
```bash
ng generate component <component-name> 
```
Angular generates four files
1. **TypeScript file (.ts)** – contains the component logic and metadata using the `@Component` decorator.
2. **HTML file (.html)** – defines the view (UI) for the component.
3. **CSS/SCSS file (.css/.scss)** – handles the styling of the component.
4. **Spec file (.spec.ts)** – used for writing unit test cases.


```ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-hello',
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.css']
})
export class HelloComponent {
  name = 'Ashish';   
  sayHi() {        
    alert('Hello ' + this.name);
  }
}
```

```html
<button (click)="sayHi()">Greet</button>
```

--- 

### How components communicate with each other?
- Components often need to share data. Since Angular follows a component-based architecture, data can flow in different direction
1. Parent ➝ Child (Using @Input), parent passes data to child.
```ts
// parent.component.ts
export class ParentComponent {
    parentMessage = "Hello from Parents!"
}
```

```html
<!-- Child Compoent inside the parent Component -->
<app-child [message]="parentMessage"></app-child>
```

```ts
// child.component.ts
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-child',
  template: `<p>{{ message }}</p>`
})
export class ChildComponent {
  @Input() message!: string;
}
```

2. Child ➝ Parent (using @Output + EventEmitter), Child sends events to parent.
3. Sibling → Sibling (Using Shared Service)
4. Router-based communication: `RouterLink` & `Navigate()`

---

### What is contetnt Projection?
Content projection in Angular is a technique that allows us to pass HTML content from a parent component into a child component and render it there.  
- It is achieved using the `<ng-content>` directive.
```html
<!-- child.component.ts -->
<div class="card">
  <h3>Reusable Card</h3>
  <ng-content></ng-content>
</div>
```

```html
<!-- parent.component.ts -->
 <app-child>
  <p>This content comes from the parent!</p>
</app-child>
```

---

### What is Authentication & Authorization?
- Authentication - Verifying the credentials given by the user matches with the credentials stored in the db.
- Authorization - What user is allowed to access.

---

### What are Angular Module?
An Angular module is a container that groups together components, directives, pipes, and services that are related to a particular feature or functionality. Angular has several types of modules:  
1. **Root Module** 
- Every Angular project has a root module, usually `AppModule`.
2. **Shared Module**
- Contains code that is used across multiple parts of the application, like headers, footers.
3. **Feature Module**
- Implements a specific functionality of the application. Example: Admin dashboard
4. **Lazy-loaded Module**
- Loaded only when required
5. **Routing Module**
- Manages the routes for a particular module or feature.

---

### What are Angular directive?
Angular directives are classes that add behavior or functionality to elements in the DOM.  
Example:  
1. `ngIf`
```ts
export class AppComponent {
    isLoggedIn = true;
}
```

```html
<p *ngIf="isLoggedIn">Welcome, User!</p>
<p *ngIf="isLoggedIn">Please Log In!</p>
```

2. `ngFor`
```ts
export class AppComponent {
    fruits = ['Apple', 'Banana', 'Orange'];
}
```

```html
<ul>
    <li *ngFor="let fruit of fruits">{{fruit}}<li>
</ul>
```

3. `ngSwitch`
```ts
export class AppComponent {
    color = 'red';
}
```

```html
<div [ngSwitch]='color'>
    <p *ngSwitchCase='red'>Red Color Selected</p>
    <p *ngSwitchCase='blue'>Blue Color Selected</p>
    <p *ngSwitchDefault></p>
</div>
```

---

### What is an Angular Service?
A service is a class that holds reusable logic, data or functions that can be shared across components.  
**Creating a Service Class**
```ts
import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root' // makes the service available application-wide
})
export class DataService {
    private data: string[] = [];

    addData(item:string) {
        this.data.push(item);
    }

    getData(){
        return this.data;
    }
}
```

**Other Component**
```ts
import { Component } from '@angular/core';
import { DataService } from './data.service';

@Component({
  selector: 'app-example',
  template: `
    <button (click)="addItem()">Add Item</button>
    <ul>
      <li *ngFor="let item of items">{{ item }}</li>
    </ul>
  `
})
export class ExampleComponent {
    items: string[] = [];

    constructor(private dataService: DataService) {} // Constructor DI

    addItem() {
        this.dataService.addData('New Item');
        this.items = this.dataService.getData();
    }
}
```

---

### Pipes in Angular ?
Pipes in Angular are used to transform data before displaying it in the template.
```html
<p>{{ name | uppercase }}</p>
```

--- 

### WHat is AuthGuard?
AuthGuard in Angular is used to prevent unauthorized access to routes. It ensures that only authenticated or authorized users can access certain parts of an application.

```ts
// app.routes.ts
{
  path: 'dashboard',
  component: DashboardComponent,
  canActivate: [AuthGuard]
}
```

---

### What is Angular Routing & Angular Navigation?
**Angular Routing**
Routing is the mechanism of defining routes in your Angular application so that different URLs show different components.  
```ts
const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'about', component: AboutComponent },
  { path: '**', component: PageNotFoundComponent } 
];
```

**Angular Navigation**
Navigation is the act of moving from one route to another programmatically or via links.  
```ts
<a routerLink="/about">Go to About</a>
```

```ts
import { Router } from '@angular/router';

constructor(private router: Router) {}

goToHome() {
  this.router.navigate(['/']);
}
```

---

### Angular Forms (Template-driven vs Reactive)?
- Template-driven Forms: Simple and easy to use. (ngForm)
- More dynamic and powerful, but slightly more complex.

---

### Angular vs AngularJS ?
- Angular => TypeScript + Component based architecture.
- AngularJS => JavaScript + MVC based architecture.

---

### Angular CLI
- Angular CLI (Command Line Interface) is a tool to create, manage, and run Angular applications efficiently.
1. `ng new <app-name>` – Creates a new Angular application with the specified name.
2. `ng serve` – Runs the Angular application locally (default: http://localhost:4200).
3. `ng build` – Compiles the application into an output directory for deployment.
4. `ng test` – Runs the unit tests for the application using Karma.
5. `ng generate component <name>` – Generates a new component with all its files.
6. `ng generate service <name>` – Generates a new service.

---

### What Observable?
- An Observable is a way to handle asynchronous data in Angular.
- Think of it like a stream of values over time (like messages coming in, clicks, HTTP responses, or real-time data).
- You can subscribe to this stream and get notified whenever there’s new data.

**Analogy**
- Observable = TV channel
- Subscriber = person watching TV
- New data = new program on the channel

---

### Basic Angular Code

Install HttpClientModule in `app.module.ts`
```ts
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule, HttpClientModule],
  bootstrap: [AppComponent]
})
export class AppModule {}
```

Create a service `user.service.ts`  
```ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface User {
  id?: number;
  name: string;
  email: string;
}

@Injectable({ providedIn: 'root' })
export class UserService {
    private baseURL = 'http://localhost:8080/api/user';

    constructor(private http: HttpClient) {}

    // GET All User
    getUser(): Observable<User[]> {
        return this.http.get<User[]>(this.baseURL);
    }

    // GET User By ID
    getUser(id: number): Observable<User[]> {
        return this.http.get<User>(`${this.baseUrl}/${id}`);
    }

    // POST new users
    createUser(user: User): Observable<User> {
        return this.http.post<User>(this.baseURL, user);
    }

    // PUT update user
    updateUser(id: number, user: User): Observable<User> {
        return this.http.put<User>(`${this.baseUrl}/${id}`, user);
    }

    // DELETE user
    deleteUser(id: number): Observable<void> {
        return this.http.delete<void>(`${this.baseUrl}/${id}`);
    }
}
```

Create `app.component.ts`

```ts
import { Component, OnInit } from '@angular/core';
import { UserService, User } from './user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
  users: User[] = [];
  newUser: User = { name: '', email: '' };

  constructor(private userService: UserService) {}

  ngOnInit() {
    this.getAllUsers();
  }

  getAllUsers() {
    this.userService.getUsers().subscribe(data => this.users = data);
  }

  addUser() {
    this.userService.createUser(this.newUser).subscribe(() => {
      this.getAllUsers(); // refresh list
      this.newUser = { name: '', email: '' };
    });
  }

  updateUser(user: User) {
    if (user.id) {
      user.name = user.name + ' Updated'; // example update
      this.userService.updateUser(user.id, user).subscribe(() => this.getAllUsers());
    }
  }

  deleteUser(id: number) {
    this.userService.deleteUser(id).subscribe(() => this.getAllUsers());
  }
}
```

Create `app.component.html`
```html
<h2>Users List</h2>
<ul>
  <li *ngFor="let user of users">
    {{ user.name }} ({{ user.email }})
    <button (click)="updateUser(user)">Update</button>
    <button (click)="deleteUser(user.id!)">Delete</button>
  </li>
</ul>

<h3>Add New User</h3>
<input type="text" placeholder="Name" [(ngModel)]="newUser.name">
<input type="email" placeholder="Email" [(ngModel)]="newUser.email">
<button (click)="addUser()">Add User</button>
```

---



