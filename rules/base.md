# Base Development Rules

## Core Programming Principles

### Clean Code
- Use descriptive names for variables, functions, and classes
- Keep functions small and focused on a single responsibility
- Avoid deep nesting - prefer early returns and guard clauses
- Remove dead code and commented-out blocks
- Use consistent indentation and formatting

### SOLID Principles
- **Single Responsibility**: Each class/function should have one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Derived classes must be substitutable for base classes
- **Interface Segregation**: Clients shouldn't depend on interfaces they don't use
- **Dependency Inversion**: Depend on abstractions, not concretions

### Testing Strategy
- Write tests before or alongside implementation (TDD/BDD)
- Aim for high test coverage on business logic
- Use descriptive test names that explain the scenario
- Follow the AAA pattern: Arrange, Act, Assert
- Mock external dependencies appropriately

### Code Organization
- Group related functionality together
- Use meaningful package/module names
- Separate concerns (business logic, data access, presentation)
- Keep configuration separate from code
- Use dependency injection for better testability

### Performance Considerations
- Measure before optimizing
- Choose appropriate data structures
- Avoid premature optimization
- Cache expensive operations when beneficial
- Consider memory usage and garbage collection impact

### Error Handling
- Fail fast and provide clear error messages
- Use exceptions for exceptional cases, not control flow
- Log errors with sufficient context for debugging
- Handle errors at the appropriate level
- Provide meaningful fallbacks when possible 