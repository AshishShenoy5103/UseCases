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