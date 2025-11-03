#!/bin/bash
# Setup script for zsh configuration
# Creates symlinks from ~/.zsh/* to $HOME, backing up existing files

set -e  # Exit on error

BACKUP_SUFFIX=".bak"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "Setting up zsh configuration symlinks..."

# Function to create symlink with backup
create_symlink() {
    local source=$1
    local target=$2

    # If target exists and is not a symlink, back it up
    if [[ -e "$target" && ! -L "$target" ]]; then
        local backup="${target}${BACKUP_SUFFIX}.${TIMESTAMP}"
        echo "  Backing up existing $target ’ $backup"
        mv "$target" "$backup"
    fi

    # Remove symlink if it exists (we'll recreate it)
    if [[ -L "$target" ]]; then
        rm "$target"
    fi

    # Create symlink
    ln -s "$source" "$target"
    echo "   $target ’ $source"
}

# Create symlinks
create_symlink "~/.zsh/zshrc" "$HOME/.zshrc"
create_symlink "~/.zsh/plugins.txt" "$HOME/.zsh_plugins.txt"

echo ""
echo " Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Review ~/.zshrc if needed"
echo "  2. Run: exec zsh"
