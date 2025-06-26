# Cursor Rules Usage Guide

This guide explains different ways to use the modular cursor rules in your projects.

## 🎯 Setup Options

### 1. Global Symlink (Recommended)

**Best for:** Most projects where you want all rules active

```bash
# Navigate to your project
cd /path/to/your/project

# Run setup script
/path/to/cursorrules/scripts/setup.sh

# Choose option 1 (symlink)
```

**Result:** Creates a symlink to the global `.cursorrules` file containing all rules.

### 2. Modular Project-Specific Rules

**Best for:** Projects where you only want specific rule modules

```bash
# Interactive selection
/path/to/cursorrules/scripts/setup.sh
# Choose option 2, then select desired modules

# Or command line
/path/to/cursorrules/scripts/setup.sh --mode modular --modules git,kotlin,linear
```

**Result:** Creates a project-specific `.cursorrules` file with only selected modules.

### 3. Command Line Options

```bash
# Show help
./scripts/setup.sh --help

# Symlink mode
./scripts/setup.sh --mode symlink

# Modular with specific modules
./scripts/setup.sh --mode modular --modules git,github,kotlin

# Interactive mode (default)
./scripts/setup.sh
```

## 📦 Available Rule Modules

| Module | Description | Best For |
|--------|-------------|----------|
| `base` | Core development principles | All projects (always included) |
| `git` | Git version control workflows | All projects using Git |
| `github` | GitHub platform features | Projects hosted on GitHub |
| `kotlin` | Kotlin-specific development rules | Kotlin/Android projects |
| `linear` | Linear issue management | Teams using Linear |
| `notion` | Documentation and knowledge management | Teams using Notion |

## 🔧 Usage Patterns

### Pattern 1: Full Stack Web Project
```bash
# Include web-focused modules
./scripts/setup.sh --mode modular --modules git,github,notion
```

### Pattern 2: Kotlin Android Project
```bash
# Include Android/Kotlin focused modules
./scripts/setup.sh --mode modular --modules git,github,kotlin,linear
```

### Pattern 3: Documentation-Heavy Project
```bash
# Include documentation focused modules
./scripts/setup.sh --mode modular --modules git,github,notion
```

### Pattern 4: Everything (Global Symlink)
```bash
# Include all rules via symlink
./scripts/setup.sh --mode symlink
```

## 📁 Manual Setup

If you prefer manual setup, you can create project-specific rules by combining modules:

### Create Custom .cursorrules File

```bash
# Navigate to your project
cd /path/to/your/project

# Create project-specific rules
cat > .cursorrules << 'EOF'
# Project-Specific Cursor Rules

# === BASE DEVELOPMENT RULES ===
EOF

# Add base rules
cat /path/to/cursorrules/rules/base.md >> .cursorrules

# Add specific modules
echo -e "\n# === GIT RULES ===" >> .cursorrules
cat /path/to/cursorrules/rules/git.md >> .cursorrules

echo -e "\n# === KOTLIN RULES ===" >> .cursorrules
cat /path/to/cursorrules/rules/kotlin.md >> .cursorrules

# Add to .gitignore
echo ".cursorrules" >> .gitignore
```

### Symlink Specific Rule Files

```bash
# Create rules directory in your project
mkdir -p .cursor-rules

# Symlink specific modules
ln -sf /path/to/cursorrules/rules/base.md .cursor-rules/
ln -sf /path/to/cursorrules/rules/kotlin.md .cursor-rules/
ln -sf /path/to/cursorrules/rules/git.md .cursor-rules/

# Create main .cursorrules that includes them
cat > .cursorrules << 'EOF'
# Include modular rules
# Note: Cursor reads this file, individual .md files are for reference
EOF

# Manually combine or reference as needed
```

## 🔄 Updating Rules

### For Symlinked Projects
Rules update automatically when you update the global cursor rules repository.

### For Modular Projects
Re-run the setup script to regenerate with updated modules:

```bash
# Re-run setup to update
./scripts/setup.sh --mode modular --modules git,kotlin,linear
```

Or use the update script:

```bash
# Check current rules
./scripts/update.sh check

# Regenerate if needed
./scripts/update.sh fix
```

## 🎨 Customization

### Project-Specific Additions

Create a `.cursorrules-project` file for project-specific rules:

```markdown
# Project-Specific Additions

## Custom Project Rules
- Use specific naming conventions for this project
- Follow project-specific architecture patterns
- Include domain-specific terminology and concepts

## Team Conventions
- Code review requirements specific to this team
- Deployment procedures for this project
- Testing strategies for this codebase
```

### Combining Approaches

You can combine different approaches:

1. **Base via symlink + project additions**
   ```bash
   ln -sf /path/to/cursorrules/.cursorrules .cursorrules-global
   # Create .cursorrules-project for project-specific rules
   ```

2. **Modular base + project templates**
   ```bash
   # Generate modular rules
   ./scripts/setup.sh --mode modular --modules git,kotlin
   
   # Add project template
   # Will be prompted during setup or copy manually
   cp /path/to/cursorrules/templates/kotlin-project.md .cursorrules-project
   ```

## 🚀 Best Practices

1. **Start Simple**: Begin with symlink approach, switch to modular if needed
2. **Team Consistency**: Use the same approach across team projects
3. **Version Control**: Add `.cursorrules` to `.gitignore` for symlinks, commit for modular
4. **Regular Updates**: Keep your global cursor rules repository updated
5. **Document Choices**: Document which approach and modules you use for each project

## 🔍 Troubleshooting

### Rules Not Working
```bash
# Check if .cursorrules exists and is valid
ls -la .cursorrules

# For symlinks, check target
readlink .cursorrules

# Restart Cursor after changes
```

### Module Not Found
```bash
# Check available modules
ls /path/to/cursorrules/rules/

# Verify module name in setup command
./scripts/setup.sh --help
```

### Conflicting Rules
```bash
# Check for multiple rule files
ls -la .cursorrules*

# Remove conflicting files and re-run setup
rm .cursorrules .cursorrules-project
./scripts/setup.sh
``` 