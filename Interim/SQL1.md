# MYSQL

### DELETE vs DROP vs TRUNCATE
- `DELETE` : Deletes specified row based on the condition (DDL).
```sql
DELETE FROM <table-name> WHERE <condtion>;
```

- `DROP` : Deletes the entire table with structure (DML).
```sql
DROP TABLE <table-name>;
```

- `TRUNCATE` : Delete all rows but retain the structure (DML). 
```sql
TRUNCATE TABLE <table-name>;
```

---

### MySQL constraints
- `NOT NULL` - Ensures that a column cannot have a NULL value
- `UNIQUE` - Ensures that all values in a column are different
- `PRIMARY KEY` - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
- `FOREIGN KEY` - Prevents actions that would destroy links between tables
- `CHECK` - Ensures that the values in a column satisfies a specific condition
- `DEFAULT` - Sets a default value for a column if no value is specified
- `CREATE INDEX` - Used to create and retrieve data from the database very quickly

---

### Prevent negative salaries using a constraint.
```sql
ALTER TABLE employee ADD CONSTRAINT salary CHECK (salary >= 0);
```

---

### ALTER TABLE SHEET

| Operation           | Syntax                                                                                                         | Purpose                     |
| ------------------- | -------------------------------------------------------------------------------------------------------------- | --------------------------- |
| **Add column**      | `ALTER TABLE table_name ADD COLUMN column_name datatype;`                                                      | Add new column              |
| **Modify column**   | `ALTER TABLE table_name MODIFY COLUMN column_name new_datatype;`                                               | Change column type or size  |
| **Rename column**   | `ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype;`                                         | Rename column + change type |
| **Rename table**    | `RENAME TABLE old_name TO new_name;`                                                                           | Rename the whole table      |
| **Drop column**     | `ALTER TABLE table_name DROP COLUMN column_name;`                                                              | Delete a column             |
| **Add PRIMARY KEY** | `ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column_name);`                             | Add primary key             |
| **Add FOREIGN KEY** | `ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (col) REFERENCES parent_table(parent_col);` | Add foreign key             |
| **Add CHECK**       | `ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (condition);`                                     | Add check constraint        |
| **Add UNIQUE**      | `ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);`                                  | Make column unique          |
| **Drop constraint** | `ALTER TABLE table_name DROP CONSTRAINT constraint_name;`                                                      | Remove any named constraint |

---

### CREATE code
```sql
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,          -- Primary Key
  name VARCHAR(100) NOT NULL,           -- NOT NULL
  email VARCHAR(100) UNIQUE,            -- UNIQUE
  salary DECIMAL(10,2) CHECK (salary >= 0), -- CHECK
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id) -- Foreign Key
);
```

---