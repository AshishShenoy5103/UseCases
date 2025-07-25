# AOP (Aspect-Oriented Programming)

### What is AOP in Spring? Why is it used?  
- AOP (Aspect-Oriented Programming) helps you separate cross-cutting concerns (like logging, transactions, security) from business logic.
- It keeps your code clean and modular.

---

### AOP Terminologies
| Term      | Meaning                                                                |
| --------- | ---------------------------------------------------------------------- |
| Aspect    | The class that contains extra behavior (e.g., logging)                 |
| Advice    | The **actual method** that runs at a point (before/after a function)   |
| JoinPoint | A place in code like a method call where advice can be applied         |
| Pointcut  | A rule to decide **where to apply** advice                             |
| Weaving   | Process of **applying the aspect** to code (done at runtime by Spring) |

---

### What is an Aspect?
An Aspect is a class that contains advice (code you want to run) and pointcut (where to run it).

---

### What is an Advice ?
Methods inside Aspect.

---

### What is a JoinPoint ?
The acutal target method.

--- 

### What is a Pointcut ?
Expression to choose the methods.

---

### Code

`PaymentService.java`

```java
@Service
public class PaymentService { 
    public void makePayment() {
        System.out.println("Payment made successfully!");
    }

    public void refundPayment() {
        System.out.println("Payment refunded");
    }
}
```

`LoggingAspect`
```java
@Aspect
@Component
public class LoggingAspect {
    // Pointcut -> it says where to apply these advices
    @PointCut("execution(* com.example.service.PaymentService.*(..))")
    public void paymentMethods() {}

    // Before the target method
    @Before("paymentMethods()")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("[Before] Method: " + joinPoint.getSignature().getName());
    }

    // After the target method
    @After("paymentMethods()")
    public void logAfter(JoinPoint joinPoint) {
        System.out.println("[After] Method: " + joinPoint.getSignature().getName());
    }

    // After returning (Only if successful)
    @AfterReturning("paymentMethods()")
    public void logAfterReturning(JoinPoint joinPoint) {
        System.out.println("[AfterReturning] Method: " + joinPoint.getSignature().getName());
    }

    // AFTER THROWING (only if exception occurs)
    @AfterThrowing("paymentMethods()")
    public void logAfterThrowing(JoinPoint joinPoint) {
        System.out.println("[AfterThrowing] Method: " + joinPoint.getSignature().getName());
    }

    // AROUND (runs before and after — full control)
    @Around("paymentMethods()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("[Around - Before] " + joinPoint.getSignature().getName());
        Object result = joinPoint.proceed(); // continue to the method
        System.out.println("[Around - After] " + joinPoint.getSignature().getName());
        return result;
    }
}

```

---