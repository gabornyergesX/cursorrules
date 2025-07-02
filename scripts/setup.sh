#!/bin/bash

# Cursor Rules Setup Script
# This script helps set up cursor rules for a new project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$(pwd)}"

echo -e "${BLUE}📋 Cursor Rules Setup${NC}"
echo -e "${BLUE}Repository: ${REPO_DIR}${NC}"
echo -e "${BLUE}Target Directory: ${TARGET_DIR}${NC}"
echo

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}[ERROR] Target directory does not exist: $TARGET_DIR${NC}"
    exit 1
fi

# Function to setup Project Rules (.cursor/rules/)
install_project_rules() {
    local target_cursor_dir="$TARGET_DIR/.cursor"
    local target_rules_dir="$target_cursor_dir/rules"
    local source_rules_dir="$REPO_DIR/.cursor/rules"
    
    echo -e "${YELLOW}[INFO] Setting up Project Rules (.cursor/rules/)${NC}"
    
    # Create .cursor directory if it doesn't exist
    if [ ! -d "$target_cursor_dir" ]; then
        mkdir -p "$target_cursor_dir"
        echo -e "${GREEN}Created .cursor directory${NC}"
    fi
    
    # Create rules directory if it doesn't exist
    if [ ! -d "$target_rules_dir" ]; then
        mkdir -p "$target_rules_dir"
        echo -e "${GREEN}Created .cursor/rules directory${NC}"
    fi
    
    # Copy or symlink rule files
    if [ -d "$source_rules_dir" ]; then
        for rule_file in "$source_rules_dir"/*.mdc; do
            if [ -f "$rule_file" ]; then
                local rule_name=$(basename "$rule_file")
                local target_file="$target_rules_dir/$rule_name"
                
                if [ -L "$target_file" ] || [ -f "$target_file" ]; then
                    echo -e "${YELLOW}[INFO] $rule_name already exists, skipping${NC}"
                else
                    ln -s "$rule_file" "$target_file"
                    echo -e "${GREEN}✓ Linked $rule_name${NC}"
                fi
            fi
        done
    else
        echo -e "${RED}[WARNING] Source .cursor/rules directory not found${NC}"
    fi
}

# Install Project Rules
install_project_rules

echo
echo -e "${GREEN}🎉 Setup completed successfully!${NC}"
echo
echo -e "${BLUE}Next steps:${NC}"
echo -e "${BLUE}• Your Project Rules are now available in .cursor/rules/${NC}"
echo -e "${BLUE}• Rules will auto-attach based on file types and context${NC}"
echo -e "${BLUE}• Use @ruleName in Cursor to manually apply specific rules${NC}"
echo -e "${BLUE}• View rules in Cursor Settings > Rules${NC}"
echo -e "${BLUE}• Customize rules by editing the source files in the cursorrules repository${NC}"
echo -e "${BLUE}• Run 'bash scripts/update.sh' to update rules when the repository changes${NC}" 