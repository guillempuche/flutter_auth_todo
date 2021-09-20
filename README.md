# auth_with_todo

A new Flutter project.

## Domain-driven design

Bounded-contexts of the app:
- Todo (a core bounded-context)
- User (a supportive bounded-context)

Domains's structure (ordered by high to low hierarchy):
1. Domain models
   1. Entities
   2. Value Objects
   3. Aggregates
   4. (optional) Domain events
2. Infrastructure: Data Transfer Objects (DTO) & repositories
3. Services
4. Presentation