# Spring RestApi

### What is Spring REST, and how is it different from traditional Spring MVC?
- REST stands for Representational State Transfer
- Spring REST is a module that allows you to build RESTful Web services using Standard HTTP methods like `GET`, `POST`, `PUT`, `DELETE`.
- It is built on top of Spring MVC but focuses on returning `JSON` or `XML`.  
**Features of REST**  
- `Stateless` - No session is stored on the server.
- `Standard HTTP methods` - We can use GET, POST, PUT, DELETE
- `Loosely Coupled`
- `Cacheable` - Responses are cached to improve performance

---

### What is the difference between `@RestController` and `@Controller`?
- `@Controller` - Returns views
- `@RestController` - Returns Json/Xml (`@Controller` + `@ResponseBody`)

---

### What is the role of @RequestMapping?
- Used to map web requests.

---

### What are @GetMapping, @PostMapping, @PutMapping, and @DeleteMapping in Spring Boot?
- `@GetMapping`    =>  GET     => Retrieve a resource
- `@PostMapping`   =>  POST    => Create a new resource
- `@PutMapping`    =>  PUT     => Update an existing resource
- `@DeleteMapping` =>  DELETE  => Delete a resource

---

### Status code
- `200 OK`              : Request success (GET, PUT, DELETE)
- `201 Created`         : New resource created (POST)
- `202 No Content`      : Success, nothing to return 
- `400 Bad Request`     : Invalid Input
- `401 Unauthorized`    : No valid authentication
- `403 Forbidden`       : Access Denied
- `404 Not Found`       : Resource doesn't exist
- `500 Internal Error`  : Server Issue

---

### Some Annotation
- `@RequestBody`  - JSON -> Java Object
- `@ResponseBody` - Java Object -> JSON
- `@PathVariable` - (/user/{id}) -> takes a variable from URL path
- `@RequestParam` - (/user?=123) -> extracts value from query string

---

### Difference between `@PutMapping` and `@PatchMapping` ?
- `@PutMapping`   - is used to replace the entire resource with updated version.
- `@PatchMapping` - is used for partial updates, where only specific field of a resource are updated, and the rest remain unchanged.

---

### How do you handle exceptions globally in Spring Boot REST API?
- Use `@ControllerAdvice` along with `@ExceptionHandler` method to catch and handle exception globally.

--- 

### What is HATEOAS in REST ?
- Hypermedia As The Engine Of Applicaiton State
- provides additional metadate for the client to navigate the API.

---

### What is Content Negotiation
- Content Negotiation in Spring REST is the process where the client tells the server what format it wants the response to be in. (JSON, XML)
- Spring looks at `Accept Header` : application/xml or application/json

---

### What is Spring Boot Actuator and how is it useful in REST APIs?
- Spring Boot Actuator is a powerful tool to monitor REST API's in production.  
**Key Features :**  
- `/actuator/health`  => Show app health status
- `/actuator/metrics` => Exposes performance metrics
- `/actuator/info`    => Custom app info like (version, build)
- `actuator/env`      => Shows environment properties

---

### REST API Versioning
- When API's evolve, breaking changes should affect the old clients. We use versioning to maintain backward compatibility.
- `/api/v1/users`, `/api/v2/users`

---

### CORS (Cross-Origin Resource Sharing)
- Frontend(localhost:3000) calls your backend(localhost:8080). 
- CORS is a security mechanism in browsers that block frontend JS from calling an API on different port unless the server explicity allows it.

---

### Testing REST Api's with MockMvc
- We can test REST endpoints without starting the whole server using MockMvc.

--- 

### JWT Flow
- User logs in with email/password.
- Server generates a JWT and sends it
- Client stores JWT (in localStorage)
- Client sends JWT with every request
- Server validates the token each request
- JWT TOKEN [Header.Payload.Signature]

--- 

### Rate Limiting
- Rate limiting is used to prevent abuse of your API by limiting the number of requests a client can make in a certain time.
- It protects against DDoS and bot attacks.
- Token Bucket and Leaky Bucket. (Bucket4j)

---

### CSRF (Cross-Site Request Forgery)
- CSRF is an attack where a malicious site tricks a logged-in user into performing actions on your app.
- JWT dont use cookies, CSRF isnt a concern.

---

## Code

### Global Exception
```java
public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(String message) {
        super(message);
    }
}
```

```java
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFound(UserNotFoundException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.NOT_FOUND);
    }
}
```

---
