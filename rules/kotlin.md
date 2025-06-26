# Kotlin Development Rules

## Kotlin-Specific Best Practices

### Language Features
- Use data classes for simple data containers
- Prefer `val` over `var` for immutability
- Use nullable types (`?`) explicitly and handle nullability properly
- Leverage Kotlin's null safety with safe calls (`?.`) and Elvis operator (`?:`)
- Use extension functions to enhance existing classes
- Prefer sealed classes over enums for complex state representation

### Functional Programming
- Use higher-order functions (map, filter, reduce) over imperative loops
- Leverage lambda expressions and function literals
- Use `let`, `run`, `apply`, `also`, and `with` scope functions appropriately
- Prefer immutable collections when possible
- Use sequences for lazy evaluation of large datasets

### Coroutines and Async
- Use coroutines for asynchronous programming instead of callbacks
- Properly handle coroutine scope and context
- Use `suspend` functions for async operations
- Handle cancellation properly with `ensureActive()` or cancellation checks
- Use structured concurrency principles
- Prefer `async`/`await` for concurrent operations

### Android Development (if applicable)
- Follow Android Architecture Components patterns
- Use ViewBinding or DataBinding instead of findViewById
- Implement proper lifecycle awareness
- Use Repository pattern for data access
- Follow Material Design guidelines
- Handle configuration changes properly

### Code Style
- Follow Kotlin coding conventions
- Use meaningful variable and function names
- Prefer expression bodies for simple functions
- Use trailing commas in multi-line parameter lists
- Keep line length reasonable (typically 120 characters)
- Use ktlint or similar for consistent formatting

### Error Handling
- Use sealed classes for representing different result states
- Leverage Result class for operations that can fail
- Prefer exceptions for truly exceptional cases
- Use inline functions for error handling utilities
- Handle resources properly with `use` function

### Performance
- Use `inline` functions judiciously for higher-order functions
- Be aware of lambda capture costs
- Use `@JvmStatic` for frequently called utility functions
- Consider using arrays instead of lists for performance-critical code
- Profile memory usage and avoid unnecessary object creation

### Testing
- Use JUnit 5 for testing
- Leverage MockK for mocking in tests
- Use Truth or similar assertion libraries
- Test coroutines with TestCoroutineDispatcher
- Write property-based tests for complex logic when appropriate 