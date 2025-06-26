#!/bin/bash

# Cursor Rules Update Script
# This script helps update and maintain cursor rules across projects

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURSOR_RULES_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${BLUE}🔄 Cursor Rules Update Utility${NC}"
echo ""

# Function to check if a directory is a git repository
is_git_repo() {
    git -C "$1" rev-parse --git-dir > /dev/null 2>&1
}

# Function to find all cursor rules files
find_cursor_rules() {
    find "$1" -name ".cursorrules" -type l 2>/dev/null
}

# Function to validate symlink
validate_symlink() {
    local link_path="$1"
    local target_path="$2"
    
    if [ -L "$link_path" ]; then
        local current_target=$(readlink "$link_path")
        if [ "$current_target" = "$target_path" ]; then
            return 0  # Valid symlink
        else
            return 1  # Invalid target
        fi
    else
        return 2  # Not a symlink
    fi
}

# Parse command line arguments
case "${1:-help}" in
    "check")
        echo "🔍 Checking cursor rules across projects..."
        echo ""
        
        # Check if we're in a specific project
        if [ -n "$2" ]; then
            PROJECT_DIR="$2"
        else
            PROJECT_DIR="$PWD"
        fi
        
        if is_git_repo "$PROJECT_DIR"; then
            PROJECT_ROOT=$(git -C "$PROJECT_DIR" rev-parse --show-toplevel)
            echo "📁 Checking project: $PROJECT_ROOT"
            
            CURSORRULES_FILE="$PROJECT_ROOT/.cursorrules"
            
            if [ -f "$CURSORRULES_FILE" ]; then
                validate_symlink "$CURSORRULES_FILE" "$CURSOR_RULES_DIR/.cursorrules"
                case $? in
                    0)
                        echo -e "${GREEN}✅ Valid symlink to cursor rules${NC}"
                        ;;
                    1)
                        echo -e "${YELLOW}⚠️  Symlink points to wrong target${NC}"
                        echo "Current target: $(readlink "$CURSORRULES_FILE")"
                        echo "Expected target: $CURSOR_RULES_DIR/.cursorrules"
                        ;;
                    2)
                        echo -e "${YELLOW}⚠️  .cursorrules exists but is not a symlink${NC}"
                        ;;
                esac
            else
                echo -e "${RED}❌ No .cursorrules found${NC}"
                echo "Run 'setup.sh' to create cursor rules for this project"
            fi
        else
            echo -e "${RED}❌ Not a git repository${NC}"
        fi
        ;;
        
    "fix")
        echo "🔧 Fixing cursor rules symlinks..."
        echo ""
        
        # Fix current project or specified directory
        if [ -n "$2" ]; then
            PROJECT_DIR="$2"
        else
            PROJECT_DIR="$PWD"
        fi
        
        if is_git_repo "$PROJECT_DIR"; then
            PROJECT_ROOT=$(git -C "$PROJECT_DIR" rev-parse --show-toplevel)
            echo "📁 Fixing project: $PROJECT_ROOT"
            
            CURSORRULES_FILE="$PROJECT_ROOT/.cursorrules"
            
            # Remove existing file/symlink
            if [ -e "$CURSORRULES_FILE" ]; then
                rm "$CURSORRULES_FILE"
                echo "🗑️  Removed existing .cursorrules"
            fi
            
            # Create new symlink
            ln -sf "$CURSOR_RULES_DIR/.cursorrules" "$CURSORRULES_FILE"
            echo -e "${GREEN}✅ Created new symlink${NC}"
        else
            echo -e "${RED}❌ Not a git repository${NC}"
        fi
        ;;
        
    "scan")
        echo "🔍 Scanning for projects with cursor rules..."
        echo ""
        
        SCAN_DIR="${2:-$HOME/dev}"
        if [ ! -d "$SCAN_DIR" ]; then
            echo -e "${RED}❌ Directory not found: $SCAN_DIR${NC}"
            exit 1
        fi
        
        echo "📂 Scanning directory: $SCAN_DIR"
        echo ""
        
        # Find all git repositories
        find "$SCAN_DIR" -name ".git" -type d 2>/dev/null | while read git_dir; do
            project_dir=$(dirname "$git_dir")
            cursorrules_file="$project_dir/.cursorrules"
            
            if [ -f "$cursorrules_file" ]; then
                echo "📁 $(basename "$project_dir")"
                echo "   Path: $project_dir"
                
                validate_symlink "$cursorrules_file" "$CURSOR_RULES_DIR/.cursorrules"
                case $? in
                    0)
                        echo -e "   Status: ${GREEN}✅ Valid${NC}"
                        ;;
                    1)
                        echo -e "   Status: ${YELLOW}⚠️  Wrong target${NC}"
                        ;;
                    2)
                        echo -e "   Status: ${YELLOW}⚠️  Not a symlink${NC}"
                        ;;
                esac
                echo ""
            fi
        done
        ;;
        
    "version")
        echo "📋 Cursor Rules Repository Information"
        echo ""
        echo "Repository: $CURSOR_RULES_DIR"
        if is_git_repo "$CURSOR_RULES_DIR"; then
            cd "$CURSOR_RULES_DIR"
            echo "Branch: $(git branch --show-current)"
            echo "Last commit: $(git log -1 --pretty=format:'%h - %s (%cr)')"
        fi
        echo ""
        echo "Available rules modules:"
        ls -1 "$CURSOR_RULES_DIR/rules/"
        ;;
        
    "help"|*)
        echo "Usage: $0 <command> [arguments]"
        echo ""
        echo "Commands:"
        echo "  check [path]     - Check cursor rules for current or specified project"
        echo "  fix [path]       - Fix broken symlinks for current or specified project"
        echo "  scan [dir]       - Scan directory for projects with cursor rules (default: ~/dev)"
        echo "  version          - Show cursor rules repository information"
        echo "  help             - Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0 check                    # Check current project"
        echo "  $0 check /path/to/project   # Check specific project"
        echo "  $0 fix                      # Fix current project"
        echo "  $0 scan ~/dev               # Scan ~/dev for projects"
        ;;
esac 