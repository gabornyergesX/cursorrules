# GitHub Platform Rules

## MCP Integration

### Working with GitHub MCP Server
- Use MCP GitHub commands for repository operations when available
- Leverage MCP for real-time repository information and status
- Prefer MCP GitHub tools over manual API calls or CLI commands
- Use MCP to fetch current PR status, issues, and repository metadata
- Combine MCP data with these workflow rules for optimal results

### MCP-Enhanced Workflows
- When creating PRs through MCP, follow the PR template guidelines below
- Use MCP to check current branch status before suggesting Git operations
- Leverage MCP issue creation with proper labeling and formatting
- Use MCP to verify repository permissions before suggesting actions
- Combine MCP repository scanning with code review best practices

## Pull Request Guidelines

### PR Title and Description
- Use clear, descriptive titles that summarize the change
- Reference related issues: "Fixes #123" or "Closes #456"
- Include summary of changes and their impact
- List any breaking changes prominently
- Add screenshots for UI changes
- Include testing instructions for reviewers

### PR Template
```markdown
## Description
Brief description of changes and why they were made

## Related Issues
- Fixes #[issue_number]
- Related to #[issue_number]

## Changes Made
- List of specific changes
- Another significant change
- Any configuration or setup changes

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manual testing completed
- [ ] Regression testing performed

## Screenshots (if applicable)
[Add screenshots here for UI changes]

## Breaking Changes
[List any breaking changes and migration steps]

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review of code completed
- [ ] Documentation updated if needed
- [ ] Tests cover the changes
- [ ] All checks are passing
```

### PR Best Practices
- Keep PRs focused and reasonably sized (< 400 lines when possible)
- Use draft PRs for work-in-progress that needs early feedback
- Request specific reviewers based on the code areas affected
- Respond to feedback promptly and constructively
- Update the PR branch when main/develop changes significantly

## Code Review Process

### For Reviewers
- Review for logic, security, and maintainability, not just syntax
- Check for potential security vulnerabilities
- Verify adequate test coverage for new functionality
- Ensure documentation is updated alongside code changes
- Provide constructive feedback with specific examples
- Approve only when confident in the changes
- Use GitHub's suggestion feature for simple fixes

### For Authors
- Explain complex decisions in PR comments or code comments
- Be responsive to reviewer feedback
- Don't take feedback personally - focus on improving the code
- Update documentation and tests alongside code changes
- Ensure all CI checks pass before requesting review
- Use GitHub's auto-merge feature when appropriate

## Issue Management

### Issue Creation
- Use descriptive titles that clearly state the problem or request
- Provide detailed descriptions with steps to reproduce (for bugs)
- Add appropriate labels for categorization and priority
- Assign issues to the right people and milestones
- Use issue templates for consistency

### Issue Templates
```markdown
## Bug Report Template
**Bug Description**
A clear description of the bug

**Steps to Reproduce**
1. Go to '...'
2. Click on '....'
3. See error

**Expected Behavior**
What you expected to happen

**Screenshots**
If applicable, add screenshots

**Environment**
- OS: [e.g. iOS]
- Browser: [e.g. chrome, safari]
- Version: [e.g. 22]
```

### Issue Labels
- `bug`: Something isn't working correctly
- `feature`: New functionality request
- `enhancement`: Improvement to existing functionality
- `documentation`: Documentation updates needed
- `good-first-issue`: Good for newcomers
- `help-wanted`: Extra attention is needed
- `wontfix`: This will not be worked on
- `duplicate`: This issue already exists

## GitHub Actions & CI/CD

### Workflow Best Practices
- Use appropriate triggers (push, pull_request, schedule)
- Cache dependencies to speed up builds
- Use matrix strategies for testing multiple environments
- Set appropriate timeouts to prevent runaway jobs
- Use secrets for sensitive data, never hardcode credentials

### Standard Workflows
```yaml
# Example CI workflow structure
name: CI
on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup environment
        # Setup steps
      - name: Run tests
        # Test commands
      - name: Upload coverage
        # Coverage reporting
```

### Security Considerations
- Use GITHUB_TOKEN for GitHub API access
- Store secrets in GitHub repository settings
- Use environment protection rules for sensitive deployments
- Regularly audit and rotate access tokens
- Use dependabot for automated dependency updates

## Repository Management

### Branch Protection
- Enable branch protection for main/develop branches
- Require pull request reviews before merging
- Require status checks to pass before merging
- Require up-to-date branches before merging
- Restrict force pushes to protected branches

### Repository Settings
- Use clear repository descriptions and topics
- Set up appropriate collaborator permissions
- Configure security alerts and automated security updates
- Set up proper issue and PR templates
- Use GitHub Pages for documentation when appropriate

### Release Management
- Use semantic versioning (MAJOR.MINOR.PATCH)
- Create releases with clear changelog and notes
- Tag releases consistently with version numbers
- Document breaking changes prominently
- Consider backward compatibility impact
- Use GitHub Releases for distributing artifacts

## GitHub Integrations

### Third-party Integrations
- Set up CI/CD integration (GitHub Actions preferred)
- Configure code quality checks (CodeQL, Dependabot)
- Use GitHub Apps for enhanced functionality
- Integrate with project management tools (Linear, Jira)
- Set up notification webhooks for team communication

### GitHub CLI Usage
```bash
# Common gh CLI commands
gh repo clone owner/repo
gh pr create --title "Feature X" --body "Description"
gh pr checkout 123
gh issue create --title "Bug report" --body "Description"
gh workflow run ci.yml
gh release create v1.0.0 --notes "Release notes"
```

## Team Collaboration

### GitHub Projects
- Use GitHub Projects for milestone tracking
- Create custom project views for different team roles
- Link issues and PRs to project items
- Use automation rules to update project status
- Track progress with project insights

### Discussions
- Use GitHub Discussions for community Q&A
- Create discussion categories for different topics
- Pin important discussions for visibility
- Encourage community participation
- Moderate discussions appropriately

### Security Features
- Enable vulnerability alerts for dependencies
- Use CodeQL for security scanning
- Review and approve GitHub Apps before installation
- Regularly audit repository access and permissions
- Use private vulnerability reporting when available 