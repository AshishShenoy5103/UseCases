# ES6 Interview Questions and Answers

This document provides a set of commonly asked ES6 JavaScript interview questions along with their answers.

---

### 1. What are arrow functions in JavaScript and how do they differ from traditional functions?

Arrow functions provide a shorter syntax for writing functions and do not have their own `this` context. Instead, they inherit `this` from the surrounding scope.

---

### 2. Explain the concept of destructuring in JavaScript ES6.

Destructuring allows extracting values from arrays or properties from objects into distinct variables using a concise syntax.

---

### 3. How does the concept of modules in ES6 improve code structure and maintenance?

Modules allow code to be split into reusable components using `export` and `import`, which promotes separation of concerns and improves maintainability, especially in large applications.

---

### 4. What are Promises in JavaScript, and how do they help in handling asynchronous operations?

Promises represent a value that may be available now, later, or never. They help manage asynchronous code more cleanly than callbacks by providing `.then()` and `.catch()` methods.

---

### 5. Why is testing important in JavaScript applications and what types of testing are commonly used?

Testing ensures code quality, reduces bugs, and improves reliability. Common types include:

- Unit testing  
- Integration testing  
- End-to-end (E2E) testing  

---

### 6. How does ES6’s `let` and `const` differ from `var`?

- `let` and `const` are block-scoped  
- `var` is function-scoped  
- Use `let` for variables that may change  
- Use `const` for values that should remain constant  

---

### 7. What is the purpose of using `try...catch` in JavaScript?

`try...catch` is used for error handling to catch and handle exceptions during code execution without crashing the application.

---

### 8. Explain the difference between unit testing and integration testing.

- **Unit testing**: Tests individual functions/components in isolation  
- **Integration testing**: Tests the interaction between multiple units/components  

---

### 9. What are JavaScript frameworks and how are they different from libraries?

- **Frameworks** provide structure and control flow (e.g., Angular)  
- **Libraries** offer reusable utilities that developers can use freely (e.g., jQuery)  

---

### 10. How does tree-shaking help optimize JavaScript applications?

Tree-shaking removes unused code during the build process, reducing bundle size and improving performance.

---

### 11. Declare a constant array named `fruits` containing `"apple"`, `"banana"`, and `"mango"`.

```js
const fruits = ["apple", "banana", "mango"];
```

---

### 12. Write an arrow function pilot that takes a name and returns "Hello, captain name!".
```js
const pilot = (name) => `Hello, captain ${name}!`;
```

---

### 13. Create an object person and use object destructuring to extract `name` and `age`.
```js
const person = { name: "Williams", age: 25 };
const { name, age } = person;
```

---

### 14. Define a function sum that takes any number of arguments and returns their total using the rest operator.
```js
const sum = (...numbers) => numbers.reduce((total, num) => total + num, 0);
```

---

### 15. Use the spread operator to merge two arrays: arr1 = [1,2] and arr2 = [3,4] into arr3.
```js
const arr1 = [1, 2];
const arr2 = [3, 4];
const arr3 = [...arr1, ...arr2];
```

---

### 16. Write a class Car with a constructor and getDetails() method.
```js
class Car {
  constructor(make, year) {
    this.make = make;
    this.year = year;
  }

  getDetails() {
    return `Car: ${this.make}, Year: ${this.year}`;
  }
}
```

---

### 17. Convert a regular multiply function into an arrow function.
```js
const multiply = (a, b) => a * b;
```

---

### 18. Write a template literal to say "I scored 95 in Math".
```js
const score = 95;
const subject = "Math";
const message = `I scored ${score} in ${subject}`;
```

---

### 19. Import a function named calculateTax from utils.js.
```js
import { calculateTax } from "./utils.js";
```

---

20. Create a new Promise that resolves with "Success" after 2 seconds
```js
const promise = new Promise((resolve) => {
  setTimeout(() => {
    resolve("Success");
  }, 2000);
});
```

---