# Git Version Control Rules

## Commit Conventions

### Commit Messages
Use conventional commit format:
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect meaning (white-space, formatting, etc.)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to build process or auxiliary tools

**Examples:**
- `feat(auth): add OAuth2 login support`
- `fix: resolve null pointer exception in user service`
- `docs: update API documentation for new endpoints`

### Commit Best Practices
- Keep commits atomic (one logical change per commit)
- Write descriptive commit messages in present tense
- Include context in the commit body when necessary
- Reference issue numbers in commit messages when applicable
- Use co-authored-by for pair programming commits

## Branching Strategy

### Branch Naming
- `feature/brief-description` - for new features
- `bugfix/issue-description` - for bug fixes
- `hotfix/critical-issue` - for critical production fixes
- `chore/maintenance-task` - for maintenance tasks
- `experiment/research-topic` - for experimental work

### Git Flow Workflow
1. Create feature branch from `main`/`develop`
2. Make commits with descriptive messages
3. Keep feature branches up to date with main branch
4. Create merge/pull request when ready
5. Delete feature branch after successful merge
6. Use tags for releases

### Branch Management
- Keep feature branches focused and short-lived
- Regularly sync with main/develop branch
- Use `git rebase` to maintain clean history when appropriate
- Avoid force-pushing to shared branches
- Use meaningful branch names that describe the work

## Git Workflow Commands

### Daily Workflow
```bash
# Start new feature
git checkout main
git pull origin main
git checkout -b feature/new-feature

# Regular development
git add .
git commit -m "feat: add new feature implementation"

# Keep branch updated
git fetch origin
git rebase origin/main

# Prepare for merge
git push origin feature/new-feature
```

### Cleanup and Maintenance
```bash
# Remove merged branches
git branch --merged | grep -v main | xargs git branch -d

# Clean up remote tracking branches
git remote prune origin

# Interactive rebase for cleaning commits
git rebase -i HEAD~3
```

## Repository Hygiene

### .gitignore Best Practices
- Use appropriate .gitignore templates for your language/framework
- Ignore build artifacts, dependencies, and temporary files
- Ignore IDE-specific files and OS-generated files
- Never commit sensitive information (keys, passwords, etc.)
- Keep .gitignore organized with comments for clarity

### Git Configuration
```bash
# Set up user information
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'

# Better diff and merge tools
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
```

## Advanced Git Features

### Stashing
- Use `git stash` to temporarily save changes
- Name stashes with descriptive messages: `git stash save "work in progress on feature X"`
- Use `git stash pop` vs `git stash apply` appropriately
- Clean up old stashes regularly

### Cherry-picking
- Use for applying specific commits to other branches
- Maintain commit message and authorship information
- Be careful with merge commits
- Document why cherry-picking was necessary

### Rebasing
- Use interactive rebase to clean up commit history
- Squash related commits before merging
- Reword commit messages for clarity
- Never rebase public/shared branches

## Git Hooks

### Pre-commit Hooks
- Run linting and formatting checks
- Execute tests before allowing commits
- Validate commit message format
- Check for sensitive information

### Pre-push Hooks
- Run full test suite
- Check for merge conflicts
- Validate branch naming conventions
- Ensure code quality standards

## Troubleshooting

### Common Issues
- Use `git reflog` to recover lost commits
- Use `git bisect` to find problematic commits
- Resolve merge conflicts carefully and test thoroughly
- Use `git reset` and `git revert` appropriately
- Understand the difference between `git merge` and `git rebase`

### Recovery Commands
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Recover deleted branch
git checkout -b recovered-branch commit-hash

# Fix last commit message
git commit --amend -m "corrected commit message"
``` 