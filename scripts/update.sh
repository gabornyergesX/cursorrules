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
    local search_dir="$1"
    # Find .cursor/rules/ directories
    find "$search_dir" -path "*/.cursor/rules" -type d 2>/dev/null | sort
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

# Function to check Project Rules (.cursor/rules/)
check_project_rules() {
    local project_root="$1"
    local cursor_dir="$project_root/.cursor"
    local rules_dir="$cursor_dir/rules"
    
    if [ -d "$rules_dir" ]; then
        echo -e "${GREEN}✅ Project Rules directory found${NC}"
        
        # Check for rule files
        local rule_count=$(find "$rules_dir" -name "*.mdc" | wc -l)
        echo "   Rule files: $rule_count"
        
        # Check for broken symlinks
        local broken_links=0
        for rule_file in "$rules_dir"/*.mdc; do
            if [ -L "$rule_file" ] && [ ! -e "$rule_file" ]; then
                broken_links=$((broken_links + 1))
            fi
        done
        
        if [ $broken_links -gt 0 ]; then
            echo -e "   ${YELLOW}⚠️  $broken_links broken symlinks found${NC}"
            return 1
        else
            echo -e "   ${GREEN}✅ All symlinks valid${NC}"
            return 0
        fi
    else
        echo -e "${YELLOW}⚠️  No Project Rules found${NC}"
        return 2
    fi
}

# Function to fix Project Rules
fix_project_rules() {
    local project_root="$1"
    local target_cursor_dir="$project_root/.cursor"
    local target_rules_dir="$target_cursor_dir/rules"
    local source_rules_dir="$CURSOR_RULES_DIR/.cursor/rules"
    
    echo -e "${YELLOW}[INFO] Fixing Project Rules${NC}"
    
    # Create directories if they don't exist
    mkdir -p "$target_rules_dir"
    
    # Remove broken symlinks
    find "$target_rules_dir" -name "*.mdc" -type l ! -e {} -delete 2>/dev/null || true
    
    # Create/update symlinks
    if [ -d "$source_rules_dir" ]; then
        for rule_file in "$source_rules_dir"/*.mdc; do
            if [ -f "$rule_file" ]; then
                local rule_name=$(basename "$rule_file")
                local target_file="$target_rules_dir/$rule_name"
                
                # Remove existing file/symlink
                [ -e "$target_file" ] && rm "$target_file"
                
                # Create new symlink
                ln -s "$rule_file" "$target_file"
                echo -e "${GREEN}✓ Updated $rule_name${NC}"
            fi
        done
    else
        echo -e "${RED}[ERROR] Source .cursor/rules directory not found${NC}"
        return 1
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
            echo ""
            
            # Check Project Rules (.cursor/rules/)
            echo "🎯 Project Rules (.cursor/rules/):"
            check_project_rules "$PROJECT_ROOT"
            project_rules_status=$?
            echo ""
            
            if [ $project_rules_status -eq 2 ]; then
                echo -e "${RED}❌ No cursor rules found${NC}"
                echo "Run 'bash scripts/setup.sh' to create cursor rules for this project"
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
            echo ""
            
            # Fix Project Rules
            fix_project_rules "$PROJECT_ROOT"
            
            echo ""
            echo -e "${GREEN}✅ Fixed cursor rules symlinks${NC}"
        else
            echo -e "${RED}❌ Not a git repository${NC}"
        fi
        ;;
        
    "scan")
        echo "🔍 Scanning for cursor rules in all repositories..."
        echo ""
        
        # Default scan directories
        SCAN_DIRS=(
            "$HOME/dev"
            "$HOME/projects"
            "$HOME/workspace"
            "$HOME/code"
            "$PWD"
        )
        
        # If arguments provided, use those instead
        if [ $# -gt 1 ]; then
            SCAN_DIRS=("${@:2}")
        fi
        
        found_projects=0
        
        for scan_dir in "${SCAN_DIRS[@]}"; do
            if [ -d "$scan_dir" ]; then
                echo -e "${BLUE}📂 Scanning: $scan_dir${NC}"
                
                # Find all git repositories
                find "$scan_dir" -name ".git" -type d 2>/dev/null | while read -r git_dir; do
                    project_dir=$(dirname "$git_dir")
                    project_name=$(basename "$project_dir")
                    
                    # Check for cursor rules
                    rules_dir="$project_dir/.cursor/rules"
                    
                    has_project=$([ -d "$rules_dir" ] && echo "true" || echo "false")
                    
                    if [ "$has_project" = "true" ]; then
                        echo -e "   📁 $project_name"
                        
                        if [ "$has_project" = "true" ]; then
                            validate_symlink "$rules_dir/base.mdc" "$CURSOR_RULES_DIR/.cursor/rules/base.mdc" 2>/dev/null
                            case $? in
                                0)
                                    echo -e "   Project Rules: ${GREEN}✅ Valid${NC}"
                                    ;;
                                1)
                                    echo -e "   Project Rules: ${YELLOW}⚠️  Wrong target${NC}"
                                    ;;
                                2)
                                    echo -e "   Project Rules: ${YELLOW}⚠️  Not a symlink${NC}"
                                    ;;
                            esac
                        fi
                        
                        found_projects=$((found_projects + 1))
                    fi
                done
                
                echo ""
            fi
        done
        
        if [ $found_projects -eq 0 ]; then
            echo -e "${YELLOW}No projects with cursor rules found${NC}"
        else
            echo -e "${GREEN}Found $found_projects projects with cursor rules${NC}"
        fi
        ;;
        
    "info")
        echo "📋 Cursor Rules Repository Information"
        echo ""
        echo "Repository Path: $CURSOR_RULES_DIR"
        echo ""
        echo "Available Rules:"
        if [ -d "$CURSOR_RULES_DIR/.cursor/rules" ]; then
            for rule_file in "$CURSOR_RULES_DIR/.cursor/rules"/*.mdc; do
                if [ -f "$rule_file" ]; then
                    rule_name=$(basename "$rule_file" .mdc)
                    echo "  $rule_name.mdc"
                fi
            done
        fi
        echo ""
        echo "Usage:"
        echo "  ./update.sh check [project_path]  - Check cursor rules status"
        echo "  ./update.sh fix [project_path]    - Fix cursor rules symlinks"
        echo "  ./update.sh scan [directories...]  - Scan for projects with cursor rules"
        echo "  ./update.sh info                   - Show this information"
        ;;
        
    *)
        echo "🔄 Cursor Rules Update Utility"
        echo ""
        echo "This utility helps manage cursor rules across multiple projects."
        echo "It supports the Project Rules format (.cursor/rules/) following"
        echo "      official Cursor documentation."
        echo ""
        echo "Usage:"
        echo "  $0 check [project_path]   - Check cursor rules status for a project"
        echo "  $0 fix [project_path]     - Fix cursor rules symlinks for a project"
        echo "  $0 scan [directories...]  - Scan directories for projects with cursor rules"
        echo "  $0 info                   - Show repository information"
        echo ""
        echo "Examples:"
        echo "  $0 check                  - Check current directory"
        echo "  $0 check ~/my-project     - Check specific project" 
        echo "  $0 fix                    - Fix current directory"
        echo "  $0 scan ~/dev ~/projects  - Scan multiple directories"
        echo "  $0 scan                   - Scan default directories"
        ;;
esac 