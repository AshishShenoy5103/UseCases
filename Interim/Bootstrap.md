# 🅱️ Bootstrap 5 Interview Questions (Easy Summary)

## 1. How do you create a responsive navigation bar?
Use `.navbar`, `.navbar-expand-lg`, `.navbar-brand`, `.navbar-toggler`, and `.collapse`. These classes make the navbar expand on large screens and collapse on smaller ones.

---

## 2. Why use a Bootstrap Carousel?
It allows image/content slideshows — perfect for galleries, banners, or promotions.

---

## 3. What are utility classes? Examples?
Utility classes are one-purpose helpers like:  
- `.text-center` – center-align text  
- `.p-3` – padding  
- `.bg-light` – background color

---

## 4. How does Bootstrap spacing utility work?
- Uses `m` (margin), `p` (padding)  
- Side: `t`, `b`, `l`, `r`, `x`, `y`, or blank  
- Size: `0–5`, `auto`  
Example: `.mt-3` → `margin-top: 1rem`

---

## 5. `.d-none` vs `.visually-hidden`?
- `.d-none`: hides element from both screen and screen readers  
- `.visually-hidden`: hides visually but **still accessible**

---

## 6. What are breakpoints?
Predefined screen widths: `sm`, `md`, `lg`, `xl`, `xxl`  
Used for responsive design with mobile-first principles.

---

## 7. Accordion vs Collapse?
- **Accordion**: Only one collapsible section open at a time  
- **Collapse**: Can toggle any number of elements individually

---

## 8. How to align items horizontally & vertically?
Use Flex utilities:
```html
<div class="d-flex justify-content-center align-items-center">...</div>
```

---

## 9. .container vs .container-fluid vs .container-{breakpoint}?
- `.container`: fixed width at breakpoints
- `.container-fluid`: full width always
- `.container-md`: fixed from md and up

---

## 10. What is Bootstrap Utility API?
It allows you to generate custom utility classes using Sass. Great for extending Bootstrap without extra CSS.

---

## 11. Structure a user profile card?
```html
<div class="card">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Name</h5>
    <p class="card-text">Description</p>
    <a href="#" class="btn btn-primary">Button</a>
  </div>
</div>
```

---

## 12. Make a responsive navbar that collapses on small screens?
```html
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="#">Brand</a>
  <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="menu">
    <!-- Nav links -->
  </div>
</nav>
```

---

## 13. Show notification and hide after 3 seconds?
```html
<div class="toast" data-bs-autohide="true" data-bs-delay="3000">Form submitted!</div>
```

---

## 14. Responsive alignment & background color?
- `.text-center`, `.text-md-end`, `.text-lg-start`
- `.bg-light`, `.bg-primary`

---

## 15. Build clean forms?
```html
<div>
  <label class="form-label">Name</label>
  <input type="text" class="form-control">
  <div class="form-text">This is a helper text.</div>
</div>
```

---

## 16. Hide on small screens, show on large?
```html
<div class="d-none d-md-block">Visible on md and up</div>
```

---

## 17. Table with light background, borders, stripes?
```html
<table class="table table-light table-bordered table-striped">
  ...
</table>
```

---

## 18. Heading with blue background & white text?
```html
<h1 class="bg-primary text-white p-3">Heading</h1>
```

---

## 19. Make login form inputs full width?
Use `.form-control` on each input:
```html
<input type="text" class="form-control">
```

---

## 20. Highlight a "Success!" message?
Use:  
```html
<div class="alert alert-success">Success!</div>
```

---

