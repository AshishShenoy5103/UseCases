# 🌐 HTML5 Interview Questions (Easy Summary)

## 1. What is HTML5 and how is it different?
HTML5 is the latest version of HTML. It added new tags like `<header>`, `<nav>`, `<video>`, etc. It works better on mobile and doesn’t need plugins for videos.

---

## 2. Can HTML5 work without CSS or JS?
Yes. HTML5 can work alone for showing content. CSS is for looks, JS is for behavior. Without them, the page still works, just looks basic.

---

## 3. Why use `<!DOCTYPE html>`?
It tells the browser you’re using HTML5 and helps show the page correctly.

---

## 4. Why add `<meta charset="UTF-8">`?
It sets the correct text encoding. It helps display all symbols and languages properly.

---

## 5. Block vs Inline Elements?
- **Block:** Takes full width (e.g., `<div>`, `<p>`)  
- **Inline:** Only needed space (e.g., `<span>`, `<a>`)

---

## 6. What are Semantic Elements?
Tags with meaning, like `<header>`, `<article>`, `<footer>`. They help with SEO and readability.

---

## 7. Can an element have multiple attributes?
Yes. Example:  
```html
<input type="email" placeholder="Enter email" required>
```

---

## 8. What does `placeholder` do?  
It shows hint text inside inputs until the user types something.

---

## 9. `onchange` vs `oninput`?
- `onchange`: Fires when user leaves the field after changing value.
- `oninput`: Fires on every keystroke.

---

## 10. required, pattern, min/max?
- `required`: Can’t leave empty.
- `pattern`: Use regex for custom rules.
- `min/max`: For numbers or dates.

---

## 11. Allow multiple file uploads?
```html
<input type="file" multiple>
```

---

## 12. Let users pick from list or enter custom input?
Use `<datalist>` with `<input list="...">`

---

## 13. Birthdate picker?
```html
<input type="date">
```

---

## 14. Save data after browser closes?
Use `localStorage`  

---

## 15. Why `required` + `disabled` doesn’t work?
Disabled fields are ignored during form submit, even if required.

---

## 16. Restrict dropdown to only preset options?
```html
<select>
  <option>India</option>
  <option>USA</option>
</select>
```

---

## 17. Best tag for blog posts?
Use `<article>` — it’s for independent content.

---

## 18. Only allow @example.com emails?
```html
<input type="email" pattern=".+@example\.com">
``` 

---

## 19. Limit message to 250 characters?
```html
<textarea maxlength="250"></textarea>
```

---

## 20. Detect user’s city?
```html
navigator.geolocation.getCurrentPosition(function(position) {
  console.log(position.coords.latitude, position.coords.longitude);
});
```

---