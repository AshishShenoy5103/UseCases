# 📊 MySQL Cheat Sheet: Aggregate, Scalar Functions & Expressions

## 📁 1. Aggregate Functions and GROUP BY

### 🔍 Concept-Based

- **Q1. What are aggregate functions?**  
  A: Operate on a set of values and return a single value.  
  Example: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`

- **Q2. What is the use of GROUP BY?**  
  A: Groups rows with the same values into summary rows.

- **Q3. Can we use WHERE with GROUP BY?**  
  A: Yes, WHERE filters rows *before* grouping.

- **Q4. Difference between COUNT(*) and COUNT(column)?**  
  A: `COUNT(*)` counts all rows, `COUNT(column)` ignores NULLs.

- **Q5. What does HAVING clause do?**  
  A: Filters groups *after* GROUP BY.

### 🧪 Code-Based

- **Q6. Count number of employees**
  ```sql
  SELECT COUNT(*) FROM employees;
  ```

- **Q7. Get average salary department-wise**
```sql
SELECT department, AVG(salary) FROM employees GROUP BY department;
```

- **Q8. Get max and min salaries**
```sql
SELECT MAX(salary), MIN(salary) FROM employees;
```

- **Q9. Departments with more than 5 employees**
```sql
SELECT department, COUNT(*) 
FROM employees 
GROUP BY department 
HAVING COUNT(*) > 5;
```

- **Q10. Total salary by job role**
```sql
SELECT job_title, SUM(salary) 
FROM employees 
GROUP BY job_title;
```

- **Q11. Departments with average salary > 60000**
```sql
SELECT department, AVG(salary) AS avg_sal 
FROM employees 
GROUP BY department 
HAVING AVG(salary) > 60000;
```

## 🧮 2. Scalar Functions
- **Q1. What are scalar functions?**  
**Operate on a single value and return a single value.**  

- **Q2. Common scalar functions:**  
`UPPER()`, `LOWER()`
`NOW()`, `CURDATE()`
`LENGTH()`, `CHAR_LENGTH()`  
`ROUND()`, `FLOOR()`, `CEIL()`

- **CHAR_LENGTH vs LENGTH?**  
`CHAR_LENGTH()` = characters, `LENGTH()` = bytes.

- **Q4. Can scalar functions be used in WHERE?**  
A scalar function is a function that returns a single value (like `UPPER()`, `LOWER()`, `LEN()`, `ROUND()`, `GETDATE()`, or user-defined functions that return a single value). Since it returns a single value, it can be compared with other values in a `WHERE` clause.