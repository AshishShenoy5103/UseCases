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

