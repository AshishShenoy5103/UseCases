# Hibernate

### What is Hibernate ?
- Hibernate is java framework.
- We can map java objects to the database tables.
- We dont have to write complex SQL queries.

---

### JDBC
- provides set of Java API's to access the relational db from the java program.

---

### Why Hibernate?  
In traditional JDBC:  
- You write SQL queries manually.
- You have to manage connections, statements, result sets yourself.
- If your table structure changes, you need to update your code everywhere.  
Hibernate:  
- You deal with Java objects (POJOs) instead of SQL.
- Handles connections, transactions, and exceptions for you.
- Has caching, lazy loading, and other advanced features.
- No need to write most SQL queries — it automatically generates SQL.

---

### Hibernate architecture
Your Java App
     ⬇️
Configuration ➡️ SessionFactory ➡️ Session ➡️ Transaction
                                     ⬇️
                                   Database

1. Configuration  
- Reads hibernate.cfg.xml (or annotations).
- Contains DB settings (URL, username, password, dialect, etc.).

2. SessionFactory
- Creates Session objects.
- Heavy object → created only once (singleton).
- Built using Configuration.

3. Session
- Like a connection to the DB.
- Used to save, fetch, update, delete Java objects (entities).

4. Transaction
- Makes sure operations are done safely (all or nothing).
- Example: Bank transfer (withdraw + deposit = one transaction).

5. Query/Criteria API
- Used to write HQL (Hibernate Query Language) or criteria-based queries.

---

### Lifecycle
1. 🚫 Transient State
- Object is created using new, but not saved in the database.
- Not associated with Hibernate.  

Example:  
Employee e = new Employee(); ← just a Java object.  

2. 💾 Persistent State
- Object is saved (using session.save() or session.persist()).
- Hibernate tracks changes to it.
- Any changes to the object will automatically update the database.

3. 🔌 Detached State
- Object was persistent, but session is closed.
- Now Hibernate no longer tracks it.
- You can reattach it later using session.update().

4. ❌ Removed State
- Object is marked for deletion using session.delete().
- Will be deleted from DB when the transaction is committed.

---

| Feature          | JDBC                           | Hibernate                          |
| ---------------- | ------------------------------ | ---------------------------------- |
| 📝 SQL Writing   | You write SQL manually         | SQL is auto-generated (HQL used)   |
| 🔄 Mapping       | No object mapping              | Maps Java objects to DB tables     |
| 🛠️ Workload     | More coding for DB operations  | Less code, handles most things     |
| 🔁 Data Handling | Manual result set handling     | Directly gets Java objects (POJOs) |
| 🔄 Transactions  | You manage manually            | Handled by Hibernate automatically |
| ⚡ Performance    | No caching                     | Has caching (1st and 2nd level)    |
| 📦 Maintenance   | Hard to maintain on DB changes | Easy with mappings                 |

---

### Inheritance
## Parent Class
```java
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "vehicle_type")
public class Vehicle {
    @Id
    private Long id;

    private String name;
}
```

## Child Class 1
```java
@Entity
@DiscriminatorValue("Car")
public class Car extends Vehicle {
    private int numDoors;
}
```

## Child Class 2
```java
@Entity
@DiscriminatorValue("Bike")
public class Bike extends Vehicle {
    private boolean hasCarrier;
}
```

---

## What Happens in DB (SINGLE_TABLE):

| id | name   | numDoors | hasCarrier | vehicle\_type |
| -- | ------ | -------- | ---------- | ------------- |
| 1  | Honda  | 4        | null       | Car           |
| 2  | Yamaha | null     | true       | Bike          |

---

##  Hibernate Performance Tuning Tips:
`Use Lazy Loading:` Avoid loading unnecessary data. By default, collections and associations should be lazily loaded using fetch = FetchType.LAZY.
`Enable Second-Level Cache:` Helps reduce database calls by storing frequently used data across sessions.
`Use Batching:` Configure hibernate.jdbc.batch_size to send multiple insert/update statements in one go.
`Avoid N+1 Problem:` Use JOIN FETCH or @BatchSize to avoid loading associated entities one-by-one in loops.
`Use Projections / DTOs:` Only fetch required columns instead of full entities.


--- 

"Caching in Hibernate is used to reduce database hits and improve performance by storing frequently accessed data in memory. Hibernate supports two levels of caching:"

🔹 First-Level Cache (L1)
- Enabled by default.
- Associated with the Hibernate Session.
- Data is cached for the duration of the session.  

🔹 Second-Level Cache (L2)
- Optional and must be configured.
- Works across sessions.
- Can use providers like EhCache, Infinispan, etc.

✅ Caching helps in faster data access, less database load, and better scalability.

---

| Strategy             | Table Structure                                  | Use Annotation                                             |
| -------------------- | ------------------------------------------------ | ---------------------------------------------------------- |
| 1. `SINGLE_TABLE`    | One table for all classes                        | `@Inheritance(strategy = InheritanceType.SINGLE_TABLE)`    |
| 2. `TABLE_PER_CLASS` | One table for each class                         | `@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)` |
| 3. `JOINED`          | Parent and child tables with join (foreign keys) | `@Inheritance(strategy = InheritanceType.JOINED)`          |

---

