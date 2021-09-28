# Todo app with authentiaction applying Domain-Driven Design

## Domain-driven design

Bounded-contexts of the app:
- Todo (a core bounded-context)
- User (a generic bounded-context)

Layers for each domain's (ordered by high to low hierarchy):
1. Domain
   1. Entity: main entity (aggregate root) with associated objects
   2. Value objects
2. Data Transfer Objects (DTO)
3. Infrastructure: repositories
4. Application (e.g. state management)
5. Presentation (i.e. the user interface)

---
Inspirated by:
- [Bloc example Todo](https://github.com/felangel/Bloc/blob/master/examples/flutter_firestore_todos)
- [ResoCoder's DDD project](https://github.com/ResoCoder/flutter-ddd-firebase-course)
- [Majid Hajian's DDD project](https://github.com/mhadaily/flutter-architecture-ddd)
- [Khalil Stemmler's DDD project](https://github.com/stemmlerjs/ddd-forum) in Typescript