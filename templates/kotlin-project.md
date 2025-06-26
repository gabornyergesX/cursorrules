# Kotlin Project Specific Rules

## Project Structure

### Standard Kotlin Project Layout
```
src/
├── main/
│   ├── kotlin/
│   │   └── com/yourcompany/project/
│   │       ├── Application.kt
│   │       ├── config/
│   │       ├── controller/
│   │       ├── service/
│   │       ├── repository/
│   │       ├── model/
│   │       └── util/
│   └── resources/
│       ├── application.properties
│       └── static/
└── test/
    ├── kotlin/
    │   └── com/yourcompany/project/
    └── resources/
```

### Build Configuration

#### Gradle (build.gradle.kts)
- Use Kotlin DSL for build scripts
- Keep dependencies organized and up to date
- Use version catalogs for dependency management
- Configure ktlint/detekt for code quality
- Set up proper test configurations

#### Dependencies
- Use BOM (Bill of Materials) for version alignment
- Prefer stable versions over snapshots in production
- Group related dependencies together
- Document why specific versions are pinned

## Framework-Specific Guidelines

### Spring Boot Projects
- Use Spring Boot starters appropriately
- Configure proper logging with structured output
- Use profiles for environment-specific configuration
- Implement proper health checks and metrics
- Use Spring's dependency injection consistently

### Android Projects
- Follow Android Gradle Plugin best practices
- Use Room for local database operations
- Implement proper Hilt/Dagger dependency injection
- Use Retrofit for network operations
- Follow Android Architecture Components (ViewModel, LiveData, etc.)

### Multiplatform Projects
- Organize common, platform-specific code properly
- Use expect/actual declarations judiciously
- Share business logic, keep UI platform-specific
- Test common code thoroughly
- Document platform-specific implementations

## Testing Strategy

### Unit Testing
- Use JUnit 5 with @Test annotations
- Create test classes with descriptive names
- Use MockK for mocking Kotlin classes
- Test edge cases and error conditions
- Maintain test data builders for complex objects

### Integration Testing
- Use TestContainers for database testing
- Test API endpoints with proper setup/teardown
- Mock external services appropriately
- Use test profiles for configuration
- Clean up resources after tests

### Test Organization
```kotlin
class UserServiceTest {
    
    @BeforeEach
    fun setup() {
        // Test setup
    }
    
    @Test
    fun `should create user when valid data provided`() {
        // Given
        val userData = UserData(...)
        
        // When
        val result = userService.createUser(userData)
        
        // Then
        assertThat(result).isSuccess()
    }
    
    @Test
    fun `should throw exception when invalid email provided`() {
        // Test implementation
    }
}
```

## Performance Considerations

### Memory Management
- Be aware of object allocation in hot paths
- Use object pools for frequently created objects
- Profile memory usage in production-like environments
- Avoid memory leaks in long-running applications

### Coroutines Best Practices
- Use appropriate dispatchers (IO, Default, Main)
- Handle cancellation properly
- Avoid blocking operations in suspend functions
- Use Flow for streaming data
- Structure concurrency with proper scopes

## Security Guidelines

### Input Validation
- Validate all user inputs
- Use data classes with validation
- Sanitize inputs for database operations
- Implement proper authentication/authorization

### Dependency Security
- Keep dependencies updated
- Use vulnerability scanning tools
- Avoid dependencies with known security issues
- Review transitive dependencies

## Deployment

### Containerization
- Use multi-stage Docker builds
- Optimize image size with appropriate base images
- Set proper JVM options for containers
- Use non-root users in containers

### Configuration Management
- Externalize configuration
- Use environment variables for secrets
- Implement proper configuration validation
- Document all configuration options 