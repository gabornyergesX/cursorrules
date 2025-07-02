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
    ├── update.sh          # Update existing symlinks
    └── install-mcp-config.sh # Install MCP config to ~/.cursor
```

## Usage

### Quick Start
```bash
# Navigate to your project
cd /path/to/your/project

# Run interactive setup
/path/to/cursorrules/scripts/setup.sh
```

### Install MCP Configuration
To install or update your MCP server configuration (e.g., for GitHub, Brave Search, etc.) in `~/.cursor/mcp.json`:

```bash
bash scripts/install-mcp-config.sh
```
- Asks for confirmation before overwriting any existing config
- Backs up previous config with a timestamp
- Uses the same color-coded output as other scripts

### Setup Options
1. **Global Symlink** (recommended) - All rules active
2. **Modular Rules** - Select specific rule modules only

### Command Line Usage
```bash
# Show all options
./scripts/setup.sh --help

# Symlink all rules
./scripts/setup.sh --mode symlink

# Use specific modules only
./scripts/setup.sh --mode modular --modules git,kotlin,linear
```

📖 **See [USAGE.md](./USAGE.md) for detailed usage patterns and examples**

## MCP Server Integration

Current MCP servers configured:
- 🤖 **Puppeteer** - Web automation and testing
- 🧠 **Sequential Thinking** - Complex reasoning and planning
- 🔍 **Brave Search** - Web search capabilities (1Password secured)
- 📦 **Git** - Version control operations
- 🐙 **GitHub** - Repository management (Docker + 1Password secured)

### Security Features
- 🔐 **1Password Integration** - Secure API key management for GitHub and Brave Search
- 🐳 **Docker Containerization** - GitHub MCP server runs in isolated container
- 🔑 **Token Isolation** - No hardcoded credentials in configuration

## Customization

The modular structure allows you to:
- Enable/disable specific tool integrations
- Add project-specific rules without affecting the global set
- Maintain consistency across all projects while allowing flexibility

## Rule Categories

Current rule modules:
- ✅ **Base** - Core development principles
- ✅ **Git** - Version control workflows
- ✅ **GitHub** - Platform features + open source contribution guide
- ✅ **Kotlin** - JVM language best practices
- ✅ **Linear** - Task management integration
- ✅ **Notion** - Documentation management 