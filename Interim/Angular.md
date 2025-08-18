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

