# 📊 SQL Data Retrieval & Filtering Cheatsheet

## 📌 SELECT Statement Basics

### 🧠 Concept-Based

| #   | Question                                                              | Answer                                                                 |
|-----|-----------------------------------------------------------------------|------------------------------------------------------------------------|
| Q1  | What is the purpose of the SELECT statement?                         | To retrieve data from one or more tables.                              |
| Q2  | What does SELECT * mean?                                             | It selects all columns from the specified table(s).                    |
| Q3  | What is the difference between DISTINCT and ALL?                     | DISTINCT returns unique values; ALL (default) includes duplicates.     |
| Q4  | Can we use expressions in SELECT statements?                         | Yes, arithmetic and string operations are allowed.                     |
| Q5  | What is a column alias?                                              | A temporary name given to a column using the AS keyword.               |

---

### 🧑‍💻 Code-Based Examples

```sql
-- Q6. Select all data from the table
SELECT * FROM employees;

-- Q7. Select specific columns
SELECT first_name, salary FROM employees;

-- Q8. Display full names as 'Employee Name'
SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name' FROM employees;

-- Q9. Add 1000 to each employee’s salary in the output
SELECT first_name, salary + 1000 AS updated_salary FROM employees;

-- Q10. Select unique job titles
SELECT DISTINCT job_title FROM employees;

-- Q11. Display full names with titles based on gender
SELECT
  CASE gender
    WHEN 'M' THEN CONCAT('Mr. ', first_name)
    ELSE CONCAT('Ms. ', first_name)
  END AS titled_name
FROM employees;

---

| #  | Question                                   | Answer                                                             |
| -- | ------------------------------------------ | ------------------------------------------------------------------ |
| Q1 | What is the WHERE clause used for?         | To filter rows based on specific conditions.                       |
| Q2 | What operators are used in WHERE clause?   | =, <>, >, <, >=, <=, BETWEEN, LIKE, IN, IS NULL, AND, OR, NOT      |
| Q3 | What does ORDER BY do?                     | Sorts result set in ascending (ASC) or descending (DESC) order.    |
| Q4 | Difference between WHERE and HAVING?       | WHERE filters rows before grouping; HAVING filters after grouping. |
| Q5 | Can we filter data using pattern matching? | Yes, using LIKE with % (any chars) and \_ (single char) wildcards. |


---

-- Q6. Employees with salary > 50000
SELECT * FROM employees WHERE salary > 50000;

-- Q7. Employees from 'New York'
SELECT * FROM employees WHERE city = 'New York';

-- Q8. Employees whose names start with 'J'
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- Q9. Employees ordered by salary (descending)
SELECT * FROM employees ORDER BY salary DESC;

-- Q10. Employees not from 'HR' or 'IT' departments
SELECT * FROM employees WHERE department NOT IN ('HR', 'IT');

---