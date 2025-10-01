#!/bin/bash

REPO_URL="https://github.com/neurobrko/dotfiles/archive/refs/heads/main.tar.gz"
BACKUP_DIR="$HOME/.dotfiles_bkp"
DRY_RUN=false

# Check for --dry-run argument
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "⚡ Dry run mode — no files will be moved."
fi

curl -s -L "$REPO_URL" | \
tar -tzf - | \
grep -v '/$' | \
while read -r file; do
    # Remove "repo-branch/" prefix
    target="${file#*/}"

    target_path="$HOME/$target"

    if [ -f "$target_path" ]; then
        if $DRY_RUN; then
            echo "Would move $target_path to $BACKUP_DIR/$target"
        else
            echo "Moving $target_path to $BACKUP_DIRi/$target"
            mkdir -p "$(dirname "$BACKUP_DIR/$target")"
            mv "$target_path" "$BACKUP_DIR/$target"
        fi
    fi
done
