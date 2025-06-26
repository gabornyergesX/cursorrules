# Linear Integration Rules

## MCP Integration

### Working with Linear MCP Server
- Use MCP Linear commands for issue management when available
- Leverage MCP to fetch real-time issue status and project information
- Use MCP to create, update, and comment on issues following the guidelines below
- Prefer MCP Linear tools over manual API calls or web interface references
- Combine MCP data with workflow best practices for optimal issue management

### MCP-Enhanced Workflows
- Use MCP to check current issue assignments before suggesting work distribution
- Leverage MCP issue creation with proper formatting and labeling
- Use MCP to link related issues and maintain project consistency
- Combine MCP team information with project organization guidelines
- Use MCP to track issue progress and update status appropriately

## Issue Management

### Issue Creation
- Use descriptive, action-oriented titles
- Start titles with verbs when possible: "Add", "Fix", "Update", "Remove"
- Include clear acceptance criteria in the description
- Add relevant labels for categorization
- Set appropriate priority based on impact and urgency
- Assign to the correct team and project

### Issue Description Format
```markdown
## Overview
Brief description of what needs to be done

## Acceptance Criteria
- [ ] Specific requirement 1
- [ ] Specific requirement 2
- [ ] Specific requirement 3

## Technical Notes
Any technical considerations or constraints

## Resources
- Links to related documentation
- Design files or mockups
- Related issues or dependencies
```

### Issue Prioritization
- **Urgent (P0)**: Critical bugs, security issues, production down
- **High (P1)**: Important features, major bugs affecting users
- **Normal (P2)**: Regular features, minor bugs, improvements
- **Low (P3)**: Nice-to-have features, documentation, cleanup

### Issue States
- **Backlog**: Not yet prioritized or assigned
- **Todo**: Ready for development, assigned
- **In Progress**: Actively being worked on
- **In Review**: Code written, needs review
- **Done**: Completed and deployed

## Development Workflow

### Branch Naming with Linear
- Include Linear issue ID in branch names: `feature/LIN-123-add-user-authentication`
- Use consistent format: `<type>/<linear-id>-<brief-description>`

### Commit Messages with Linear
- Reference Linear issues in commit messages
- Use format: `feat(auth): add OAuth2 support (LIN-123)`
- Link multiple commits to same issue when appropriate

### Pull Requests with Linear
- Reference Linear issue in PR description: "Fixes LIN-123"
- Use Linear's GitHub integration for automatic linking
- Update issue status when PR is merged

## Project Organization

### Project Structure
- Group related issues into projects
- Use milestones for release planning
- Track progress with project views
- Set up automated workflows for common patterns

### Team Collaboration
- Use mentions (@username) for notifications
- Add comments for status updates and blockers
- Use sub-issues for breaking down large tasks
- Link related issues for context

### Reporting and Metrics
- Track cycle time and lead time
- Monitor team velocity
- Use Linear's insights for process improvement
- Review completed work in retrospectives

## Labels and Categories

### Standard Labels
- `bug`: Something isn't working correctly
- `feature`: New functionality
- `enhancement`: Improvement to existing functionality
- `documentation`: Documentation updates
- `technical-debt`: Code quality improvements
- `dependencies`: Updates to dependencies
- `security`: Security-related changes

### Component Labels
- Use component-specific labels: `frontend`, `backend`, `mobile`, `api`
- Include technology labels: `kotlin`, `react`, `nodejs`

### Size Estimation
- Use Linear's estimation feature consistently
- Define story point scale (1=small, 2=medium, 3=large, 5=extra-large)
- Estimate based on complexity, not time
- Re-estimate if scope changes significantly

## Integration Best Practices

### Automation
- Set up Linear webhooks for team notifications
- Use Linear's API for custom integrations
- Automate issue state transitions where possible
- Create templates for common issue types

### Documentation
- Link Linear issues to relevant documentation
- Update technical specifications when requirements change
- Maintain ADRs (Architecture Decision Records) for significant decisions
- Cross-reference between Linear and other tools (Notion, GitHub)

### Quality Assurance
- Include QA steps in acceptance criteria
- Use Linear for bug tracking and resolution
- Link bug reports to original feature issues
- Track regression issues and their fixes 