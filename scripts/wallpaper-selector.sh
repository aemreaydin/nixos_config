#!/usr/bin/env bash

# Search in both dotfiles assets and user Pictures directory
DOTFILES_WALLPAPERS="$HOME/dotfiles/assets/wallpapers"
USER_WALLPAPERS="$HOME/Pictures/Wallpapers"

# Create user wallpapers directory if it doesn't exist
mkdir -p "$USER_WALLPAPERS"

# Find wallpapers from both locations
wallpaper=$(find "$DOTFILES_WALLPAPERS" "$USER_WALLPAPERS" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) 2>/dev/null | \
  fzf --preview 'kitten icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}')

if [ -n "$wallpaper" ]; then
  # Generate theme and set wallpaper with matugen
  matugen image "$wallpaper"
fi
