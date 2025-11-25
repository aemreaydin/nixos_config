#!/usr/bin/env bash
set -euo pipefail

# NixOS Host Setup Script
# Relabels disk partitions and rebuilds the system
# Usage: sudo ./setup-host.sh <hostname>
# Example: sudo ./setup-host.sh framework13

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check root
if [[ $EUID -ne 0 ]]; then
   log_error "Run as root: sudo $0 <hostname>"
   exit 1
fi

# Check arguments
if [ $# -lt 1 ]; then
    log_error "Usage: $0 <hostname>"
    log_info "Available: desktop, framework13"
    exit 1
fi

HOSTNAME=$1

# Validate hostname
if [[ ! "$HOSTNAME" =~ ^(desktop|framework13)$ ]]; then
    log_error "Invalid hostname. Must be 'desktop' or 'framework13'"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

log_info "Setting up NixOS for: $HOSTNAME"
log_info "Dotfiles location: $DOTFILES_DIR"

# Find current partitions
log_info "Detecting current partition layout..."

ROOT_DEV=$(findmnt -n -o SOURCE /)
BOOT_DEV=$(findmnt -n -o SOURCE /boot)
SWAP_DEV=$(swapon --noheadings --raw | awk '{print $1}' | head -n1)

echo "  Root: $ROOT_DEV"
echo "  Boot: $BOOT_DEV"
echo "  Swap: ${SWAP_DEV:-none}"

# Relabel partitions
log_info "Relabeling partitions..."

# Root partition (ext4)
CURRENT_ROOT_LABEL=$(lsblk -n -o LABEL "$ROOT_DEV" 2>/dev/null || echo "")
if [ "$CURRENT_ROOT_LABEL" != "NIXOS_ROOT" ]; then
    log_info "Relabeling root: '$CURRENT_ROOT_LABEL' -> 'NIXOS_ROOT'"
    e2label "$ROOT_DEV" NIXOS_ROOT
else
    log_info "Root already labeled correctly: NIXOS_ROOT"
fi

# Boot partition (vfat)
CURRENT_BOOT_LABEL=$(lsblk -n -o LABEL "$BOOT_DEV" 2>/dev/null || echo "")
if [ "$CURRENT_BOOT_LABEL" != "NIXOS_BOOT" ]; then
    log_info "Relabeling boot: '$CURRENT_BOOT_LABEL' -> 'NIXOS_BOOT'"
    fatlabel "$BOOT_DEV" NIXOS_BOOT
else
    log_info "Boot already labeled correctly: NIXOS_BOOT"
fi

# Swap partition
if [ -n "$SWAP_DEV" ]; then
    CURRENT_SWAP_LABEL=$(lsblk -n -o LABEL "$SWAP_DEV" 2>/dev/null || echo "")
    if [ "$CURRENT_SWAP_LABEL" != "swap" ]; then
        log_info "Relabeling swap: '$CURRENT_SWAP_LABEL' -> 'swap'"
        swapoff "$SWAP_DEV"
        mkswap -L swap "$SWAP_DEV"
        swapon "$SWAP_DEV"
    else
        log_info "Swap already labeled correctly: swap"
    fi
else
    log_warn "No swap partition detected"
fi

# Verify labels
log_info "Verifying labels..."
lsblk -o NAME,LABEL,FSTYPE,SIZE,MOUNTPOINT | grep -E "(NAME|NIXOS|swap)"

# Rebuild system
log_info "Rebuilding NixOS system..."
cd "$DOTFILES_DIR"
nixos-rebuild switch --flake ".#$HOSTNAME"

log_info "✅ Setup complete for $HOSTNAME!"
