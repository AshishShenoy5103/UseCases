# 🎨 CSS Interview Questions (Easy Summary)

## 1. What is the purpose of the `<style>` tag in HTML?
It is used to embed CSS rules directly in the HTML file, usually in the `<head>` section.

---

## 2. Difference between class selector and ID selector?
- `.class` can be used on multiple elements.  
- `#id` should be unique for one element.

---

## 3. What does the universal selector `*` do?
It selects **all elements** on the page.

---

## 4. What is the Box Model?
The Box Model includes:  
**Content → Padding → Border → Margin**  
It defines how elements are sized and spaced.

---

## 5. inline vs block vs inline-block?
- `inline`: No new line, no width/height.  
- `block`: Starts on a new line, takes full width.  
- `inline-block`: Flows inline but allows width/height.

---

## 6. em vs rem units?
- `em`: Relative to **parent’s** font size.  
- `rem`: Relative to **root (html)** font size.

---

## 7. What is `z-index`?
Controls stack order (which element appears on top). Higher = on top.

---

## 8. Purpose of media queries?
They let CSS change based on screen/device size. Helps in responsive design.

---

## 9. What is Responsive Web Design (RWD)?
It’s a design method where the layout adjusts to different screen sizes (mobile, tablet, etc.).

---

## 10. min-width vs max-width in media queries?
- `min-width`: Styles apply **from** that width and up (mobile-first).  
- `max-width`: Styles apply **up to** that width (desktop-first).

---

## 11. CSS to make all `<p>` text blue?
```css
p {
  color: blue;
}
```

---

## 12. CSS to give #box1 a green background and white text?
```css
#box1 {
  background-color: green;
  color: white;
}
```

---

## 13. Padding: 20px, Border: 2px black, Margin: 10px?
```css
.box {
  padding: 20px;
  border: 2px solid black;
  margin: 10px;
}
```

---

## 14. Total width of a box with:
- Width: 200px
- Padding: 10px
- Border: 5px
- Margin: 15px  
Total = 200 + (10×2) + (5×2) + (15×2) = 260px  

---

## 15. Two boxes, one has padding, one has border — which takes more space?
- In `content-box`, padding adds to size → more space taken.
- In `border-box`, total space remains same.

---

## 16. Media query for red background below 600px:
```css
@media (max-width: 600px) {
  body {
    background-color: red;
  }
}
```

---

## 17. Hide .menu on screens less than 480px:
```css
@media (max-width: 480px) {
  .menu {
    display: none;
  }
}
```

---

## 18. Layout breaks on tablets — what to do?
- Use media queries for 768px–1024px to adjust layout.
- E.g., change flex direction, widths, etc.

---

## 19. Media query not working — possible syntax issues?
- Forgot `@media`
- Missed parentheses
- Wrong keyword (e.g., used `min-width` instead of `max-width`)

---

## 20. Why use percentage widths? Example?
They scale with screen size = responsive layout.  
```css
.container {
  width: 80%;
}
```

---