# Cursor Rules Repository

This repository contains standardized cursor rules that are project-agnostic and can be symlinked into any project for consistent AI assistant behavior across all development work.

## Directory Structure

```
cursorrules/
├── README.md                 # This file
├── .cursorrules             # Main global cursor rules
├── rules/                   # Modular rule components
│   ├── base.md             # Core development principles
│   ├── git.md              # Git version control workflows
│   ├── github.md           # GitHub platform features
│   ├── kotlin.md           # Kotlin-specific rules
│   ├── linear.md           # Linear integration rules
│   └── notion.md           # Notion integration rules
├── templates/              # Project-specific rule templates
│   ├── kotlin-project.md   # Kotlin project specific additions
│   └── web-project.md      # Web project specific additions
└── scripts/               # Utility scripts
    ├── setup.sh           # Setup script for new projects
    └── update.sh          # Update existing symlinks
```

## Usage

### For New Projects
1. Clone or symlink this repository into your project root
2. Run `./scripts/setup.sh` to create appropriate symlinks
3. Customize project-specific rules if needed

### For Existing Projects
1. Navigate to your project root
2. Create symlink: `ln -sf /path/to/cursorrules/.cursorrules .cursorrules`
3. Restart Cursor to apply new rules

## Customization

The modular structure allows you to:
- Enable/disable specific tool integrations
- Add project-specific rules without affecting the global set
- Maintain consistency across all projects while allowing flexibility

## Tools Integration

Current integrations:
- ✅ Linear (task management)
- ✅ Notion (documentation)
- ✅ Git (version control)
- ✅ GitHub (platform features)
- ✅ Kotlin (primary language) 