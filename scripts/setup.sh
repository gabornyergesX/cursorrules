#!/bin/bash

# Cursor Rules Setup Script
# This script helps set up cursor rules for a new project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURSOR_RULES_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${GREEN}🎯 Cursor Rules Setup${NC}"
echo "Setting up cursor rules for your project..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}"
    echo "Please run this script from within a git repository."
    exit 1
fi

# Get project root (git root)
PROJECT_ROOT=$(git rev-parse --show-toplevel)
echo "📁 Project root: $PROJECT_ROOT"

# Check if .cursorrules already exists
if [ -f "$PROJECT_ROOT/.cursorrules" ]; then
    echo -e "${YELLOW}⚠️  .cursorrules already exists${NC}"
    read -p "Do you want to replace it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Setup cancelled."
        exit 0
    fi
    rm "$PROJECT_ROOT/.cursorrules"
fi

# Create symlink to main cursor rules
ln -sf "$CURSOR_RULES_DIR/.cursorrules" "$PROJECT_ROOT/.cursorrules"
echo -e "${GREEN}✅ Created symlink to global cursor rules${NC}"

# Detect project type and suggest additional templates
echo ""
echo "🔍 Detecting project type..."

PROJECT_TYPE=""
if [ -f "$PROJECT_ROOT/build.gradle.kts" ] || [ -f "$PROJECT_ROOT/build.gradle" ]; then
    PROJECT_TYPE="kotlin"
    echo "📱 Detected Kotlin/Gradle project"
elif [ -f "$PROJECT_ROOT/package.json" ]; then
    PROJECT_TYPE="web"
    echo "🌐 Detected Web/Node.js project"
elif [ -f "$PROJECT_ROOT/pom.xml" ]; then
    PROJECT_TYPE="kotlin"
    echo "☕ Detected Java/Maven project (using Kotlin template)"
fi

# Offer to create project-specific rules
if [ -n "$PROJECT_TYPE" ]; then
    echo ""
    read -p "Would you like to create project-specific cursor rules? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        TEMPLATE_FILE="$CURSOR_RULES_DIR/templates/${PROJECT_TYPE}-project.md"
        PROJECT_RULES_FILE="$PROJECT_ROOT/.cursorrules-project"
        
        if [ -f "$TEMPLATE_FILE" ]; then
            cp "$TEMPLATE_FILE" "$PROJECT_RULES_FILE"
            echo -e "${GREEN}✅ Created project-specific rules: .cursorrules-project${NC}"
            echo "💡 You can customize these rules for your specific project needs"
        else
            echo -e "${YELLOW}⚠️  Template not found: $TEMPLATE_FILE${NC}"
        fi
    fi
fi

# Create .gitignore entry if needed
if [ -f "$PROJECT_ROOT/.gitignore" ]; then
    if ! grep -q ".cursorrules" "$PROJECT_ROOT/.gitignore"; then
        echo ""
        read -p "Add .cursorrules to .gitignore? (recommended) (Y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            echo "" >> "$PROJECT_ROOT/.gitignore"
            echo "# Cursor AI rules (symlinked from global config)" >> "$PROJECT_ROOT/.gitignore"
            echo ".cursorrules" >> "$PROJECT_ROOT/.gitignore"
            echo -e "${GREEN}✅ Added .cursorrules to .gitignore${NC}"
        fi
    fi
fi

echo ""
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Restart Cursor to apply the new rules"
echo "2. Review and customize .cursorrules-project if created"
echo "3. Enjoy improved AI assistance! 🚀"

# Show what was created
echo ""
echo "Files created/modified:"
echo "  📄 .cursorrules -> $CURSOR_RULES_DIR/.cursorrules"
if [ -f "$PROJECT_ROOT/.cursorrules-project" ]; then
    echo "  📄 .cursorrules-project (project-specific rules)"
fi
if grep -q ".cursorrules" "$PROJECT_ROOT/.gitignore" 2>/dev/null; then
    echo "  📄 .gitignore (updated)"
fi 