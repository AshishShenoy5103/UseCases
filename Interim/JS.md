# 📜 JavaScript Interview Questions (Easy Summary)

## 1. What is JavaScript, and how is it different from HTML and CSS?
JavaScript is a scripting language for interactivity.  
- **HTML** = structure  
- **CSS** = style  
- **JavaScript** = behavior (e.g., clicks, animations)

---

## 2. Function Scope vs Block Scope?
- `var` = function-scoped  
- `let` & `const` = block-scoped (within `{}`)

---

## 3. What is Asynchronous Programming?
It allows tasks like API calls or timers to run **without blocking** the main thread, keeping the page responsive.

---

## 4. What is AJAX?
**AJAX** = Asynchronous JavaScript and XML  
Lets pages update content without reloading.

---

## 5. Array vs Object?
- **Array** = Ordered values, accessed by index  
- **Object** = Key-value pairs, unordered

---

## 6. Difference between `==` and `===`?
- `==` → loose equality (type conversion)  
- `===` → strict equality (no conversion)

---

## 7. How to select and change element content?
```javascript
document.getElementById("id").innerText = "New Text";
```

---

## 8. How does `.push()` work?
- Adds elements to end of an array.
- Returns new length.

---

## 9. What is a callback function?
- A function passed to another to be called later.
- Used in async tasks like setTimeout().

---

## 10. undefined vs null?
- undefined = variable declared but not assigned
- null = manually set to "nothing"

--- 

## 11. Declare a constant username?
```js
const userName = "Alice";
```

---

## 12. Log "Done!" after 2 seconds?
```js
setTimeout(() => {
  console.log("Done!");
}, 2000);
```

---

## 13. Fetch data from API and log it?
```js
fetch("https://api.example.com/users")
  .then(res => res.json())
  .then(data => console.log(data));
```

---

## 14. Get numbers > 10 from array?
```js
const result = array.filter(num => num > 10);
```

---

## 15. Check if variable is a number?
```js
if (typeof score === "number") {
  // it's a number
}
```

---

## 16. Why can age change from number to string?  
Because JavaScript is loosely typed — variables can change types unless manually restricted.  

---

## 17. Remove last item from cart and show it?
```js
const removedItem = cart.pop();
alert(`Removed: ${removedItem}`);
```

---

## 18. Two setTimeouts with same delay?
- Both will run after ~same delay.
- Order not guaranteed if there's heavy load or tasks queued.

---

## 19. Payment error handling (network, card, server)?
Use:  
- try-catch for API calls
- Custom errors: NetworkError, ValidationError, ServerError
- Friendly messages: "Check your connection", "Invalid card"
- Retry logic and fallbacks

---

## 20. Two functions with same name?
The last function overrides the first in the same scope.
```js
function greet() { console.log("Hello"); }
function greet() { console.log("Hi"); }

greet(); // Output: Hi
```

---
