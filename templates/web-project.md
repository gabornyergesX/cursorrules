# Web Project Specific Rules

## Frontend Development

### Modern Web Standards
- Use semantic HTML elements
- Implement proper accessibility (WCAG guidelines)
- Optimize for performance (Core Web Vitals)
- Support responsive design patterns
- Use progressive enhancement principles

### JavaScript/TypeScript Best Practices
- Use TypeScript for type safety
- Implement proper error boundaries
- Use modern ES6+ features
- Follow consistent naming conventions
- Optimize bundle size and loading

### CSS Organization
- Use CSS custom properties for theming
- Implement consistent spacing and typography systems
- Use CSS Grid and Flexbox appropriately
- Follow mobile-first responsive design
- Organize styles with methodologies (BEM, CSS-in-JS)

## Backend API Development

### RESTful API Design
- Use appropriate HTTP methods and status codes
- Implement consistent error response formats
- Version APIs properly
- Document endpoints with OpenAPI/Swagger
- Use proper content types and headers

### GraphQL (if applicable)
- Design efficient schema with proper types
- Implement proper error handling
- Use DataLoader for N+1 query prevention
- Cache queries appropriately
- Document schema with descriptions

### API Security
- Implement proper authentication (JWT, OAuth2)
- Use HTTPS everywhere
- Validate and sanitize all inputs
- Implement rate limiting
- Use CORS policies appropriately

## Performance Optimization

### Frontend Performance
- Implement code splitting and lazy loading
- Optimize images and media assets
- Use appropriate caching strategies
- Minimize and compress resources
- Monitor Core Web Vitals

### Backend Performance
- Implement database query optimization
- Use appropriate caching layers (Redis, CDN)
- Optimize API response times
- Monitor application performance
- Use connection pooling for databases

## Testing Strategy

### Frontend Testing
- Unit tests for business logic
- Integration tests for components
- End-to-end tests for critical user flows
- Visual regression testing
- Accessibility testing

### Backend Testing
- Unit tests for business logic
- Integration tests for APIs
- Database integration tests
- Load testing for performance
- Security testing for vulnerabilities

## Development Workflow

### Build and Deploy
- Use CI/CD pipelines
- Implement proper staging environments
- Use feature flags for gradual rollouts
- Automate testing and quality checks
- Monitor deployments and rollback capabilities

### Code Quality
- Use linting tools (ESLint, Prettier)
- Implement code coverage thresholds
- Use static analysis tools
- Conduct regular code reviews
- Maintain consistent coding standards

## Monitoring and Observability

### Logging
- Use structured logging formats
- Log appropriate levels (error, warn, info, debug)
- Include correlation IDs for request tracing
- Avoid logging sensitive information
- Implement centralized logging

### Metrics and Monitoring
- Monitor application performance metrics
- Track business metrics and KPIs
- Set up alerting for critical issues
- Use distributed tracing for complex systems
- Monitor infrastructure and resource usage

### Error Tracking
- Implement global error handling
- Use error tracking services (Sentry, Bugsnag)
- Include proper error context and stack traces
- Monitor error rates and trends
- Set up alerts for critical errors 