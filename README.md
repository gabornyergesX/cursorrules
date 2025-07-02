# Cursor Rules Repository

A comprehensive collection of standardized Cursor rules following the [official Project Rules format](https://docs.cursor.com/context/rules). These project-agnostic rules provide consistent AI assistant behavior across all development work.

## 🏗️ Project Structure

Following the official Cursor documentation, rules are organized as **Project Rules** in `.cursor/rules/` with proper MDC (Metadata Document Content) format:

```
cursorrules/
├── README.md                 # This documentation
├── .cursor/rules/           # Official Project Rules (MDC format)
│   ├── base.mdc            # Core development principles (Always applied)
│   ├── kotlin.mdc          # Effective Kotlin guidelines (Auto-attached to .kt/.kts)
│   ├── git.mdc             # Git workflows (Auto-attached to git files)
│   ├── github.mdc          # GitHub platform features (Auto-attached to .github/)
│   ├── linear.mdc          # Linear integration (Agent requested)
│   └── notion.mdc          # Notion documentation (Agent requested)
├── scripts/                # Setup and maintenance scripts
│   ├── setup.sh           # Main installation script
│   ├── install-mcp-config.sh  # MCP server configuration installer
│   └── update.sh          # Update existing installations
├── templates/             # Project-specific rule templates
│   ├── kotlin-project.md  # Kotlin project template
│   └── web-project.md     # Web development template
├── mcp.json              # MCP server configuration
└── USAGE.md              # Detailed usage instructions
```

## 🎯 Rule Categories

### Always Applied Rules
- **`base.mdc`** - Core development principles, SOLID principles, testing strategies

### Auto-Attached Rules
- **`kotlin.mdc`** - "Effective Kotlin" best practices (auto-attaches to `*.kt`, `*.kts`)
- **`git.mdc`** - Git workflows and commit standards (auto-attaches to git files)
- **`github.mdc`** - GitHub platform features and open source contribution guidelines (auto-attaches to `.github/`)

### Agent-Requested Rules
- **`linear.mdc`** - Linear integration and issue management
- **`notion.mdc`** - Documentation and knowledge management

## 🔧 MCP Server Integration

Your `~/.cursor/mcp.json` includes 5 configured MCP servers for enhanced functionality:

- **🌐 Puppeteer** - Web automation and browser interaction
- **🧠 Sequential Thinking** - Advanced reasoning and problem-solving  
- **🔍 Brave Search** - Real-time web search capabilities
- **🐙 GitHub** - Repository management and collaboration (via Docker)
- **⚡ Git** - Version control operations

### Security Features
- **🔐 1Password Integration** - Secure API key management for GitHub and Brave Search
- **🐳 Docker Containerization** - GitHub MCP server runs in isolated container
- **🔒 Token Isolation** - No hardcoded credentials in configuration

## 🚀 Quick Start

### Install Project Rules
```bash
# Clone the repository
git clone https://github.com/yourusername/cursorrules.git

# Install Project Rules to your project
cd your-project
bash /path/to/cursorrules/scripts/setup.sh
```

### Install MCP Configuration
```bash
# Install MCP server configuration
bash scripts/install-mcp-config.sh
```

## 📖 How It Works

Following the [official Cursor documentation](https://docs.cursor.com/context/rules):

### Rule Types
- **Always Applied**: `base.mdc` provides core principles for all contexts
- **Auto-Attached**: Rules automatically apply when relevant files are in context
- **Agent Requested**: AI decides when to apply based on context and description
- **Manual**: Apply explicitly using `@ruleName` in Cursor

### MDC Format
Each rule uses MDC front-matter for configuration:
```yaml
---
description: Rule description for AI context
globs: ["**/*.kt", "**/*.kts"]  # File patterns for auto-attachment
alwaysApply: false                 # Whether to always include
---
```

### Rule Hierarchy
- Global rules apply to all contexts
- File-specific rules auto-attach based on `globs` patterns
- Agent-requested rules activate based on relevance
- Manual rules require explicit invocation

## 🛠️ Usage

### In Cursor
- Rules auto-attach based on file context
- Use `@ruleName` to manually apply specific rules
- View active rules in Cursor Settings > Rules
- Generate new rules with `/Generate Cursor Rules` command

### Update Rules
```bash
# Update existing installations
bash scripts/update.sh
```

### Customize for Your Team
1. Fork this repository
2. Modify rules in `.cursor/rules/` to match your standards
3. Update `mcp.json` with your API keys and preferences
4. Share the fork with your team

## 🎨 Features

### Language Support
- **Kotlin**: Comprehensive "Effective Kotlin" guidelines with auto-attachment
- **Git**: Version control best practices and conventional commits
- **Universal**: Core development principles for any language

### Integration Support  
- **GitHub**: Platform features, Actions, PR guidelines, open source contribution workflow
- **Linear**: Issue management and project tracking
- **Notion**: Documentation and knowledge management
- **MCP Servers**: Real-time data access and tool integration

### Open Source Contribution
- **Project Discovery**: How to find good projects to contribute to
- **Issue Selection**: Identifying well-scoped, beginner-friendly issues
- **Contribution Workflow**: Complete guide from research to PR submission
- **Best Practices**: Communication, code quality, and community engagement

## 📚 Learn More

- [Official Cursor Rules Documentation](https://docs.cursor.com/context/rules)
- [MDC Format Guide](https://docs.cursor.com/context/rules#example-mdc-rule)
- [Best Practices](https://docs.cursor.com/context/rules#best-practices)
- [USAGE.md](USAGE.md) - Detailed usage instructions and examples

## 🤝 Contributing

1. Fork the repository
2. Create feature branch following git conventions
3. Update relevant `.mdc` files in `.cursor/rules/`
4. Test rules in a sample project
5. Submit PR with clear description

## 📄 License

MIT License - Use freely in personal and commercial projects. 