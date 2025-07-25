# SQL

### INSERT COMMAND
```sql
-- Insert one row
INSERT INTO employees (employee_id, name, email, salary, dept_id)
VALUES (1, 'Ashish', 'ashish@example.com', 50000.00, 101);

-- Insert multiple rows
INSERT INTO employees (employee_id, name, email, salary, dept_id)
VALUES 
  (2, 'Ravi', 'ravi@example.com', 45000.00, 101),
  (3, 'Priya', 'priya@example.com', 48000.00, 102);

```

---

### UPDATE COMMAND
```sql
-- Update salary for one employee
UPDATE employees
SET salary = 55000.00
WHERE employee_id = 1;

-- Update multiple columns
UPDATE employees
SET salary = 60000.00, dept_id = 103
WHERE name = 'Priya';
```

---

### DELETE COMMAND
```sql
-- Delete one row
DELETE FROM employees
WHERE employee_id = 2;

-- Delete all rows (but keep table)
DELETE FROM employees;
```

---