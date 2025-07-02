#!/bin/bash

set -e

# Colors for output (same as setup.sh)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MCP_SRC="$REPO_DIR/mcp.json"
CURSOR_DIR="$HOME/.cursor"
MCP_DEST="$CURSOR_DIR/mcp.json"

# Check if mcp.json exists in the repo
if [ ! -f "$MCP_SRC" ]; then
  echo -e "${RED}[ERROR] mcp.json not found in repository root ($MCP_SRC).${NC}"
  exit 1
fi

# Create ~/.cursor directory if it doesn't exist
if [ ! -d "$CURSOR_DIR" ]; then
  echo -e "${BLUE}[INFO] Creating $CURSOR_DIR directory.${NC}"
  mkdir -p "$CURSOR_DIR"
fi

# Ask for confirmation if file exists, or before installing
if [ -f "$MCP_DEST" ]; then
  echo -e "${YELLOW}⚠️  ~/.cursor/mcp.json already exists.${NC}"
  read -p "Do you want to replace it? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation cancelled.${NC}"
    exit 0
  fi
  BACKUP_FILE="$MCP_DEST.backup.$(date +%Y%m%d%H%M%S)"
  echo -e "${YELLOW}[INFO] Backing up existing mcp.json to $BACKUP_FILE.${NC}"
  mv "$MCP_DEST" "$BACKUP_FILE"
else
  echo -e "${BLUE}This will install mcp.json to $MCP_DEST${NC}"
  read -p "Proceed? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation cancelled.${NC}"
    exit 0
  fi
fi

# Copy new mcp.json
cp "$MCP_SRC" "$MCP_DEST"
echo -e "${GREEN}[SUCCESS] mcp.json installed to $MCP_DEST.${NC}"

echo ""
echo "To customize your MCP configuration, edit: $MCP_DEST"
echo "If you use 1Password, ensure you have the correct vault and item names for your tokens." 