# NixOS Setup Scripts

## setup-host.sh

Quick setup script for configuring NixOS hosts.

### What it does

1. **Detects current partitions** - Finds your root, boot, and swap partitions
2. **Relabels partitions** - Updates labels to match hardware configuration:
   - Root → `NIXOS_ROOT` (ext4)
   - Boot → `NIXOS_BOOT` (vfat)
   - Swap → `swap`
3. **Rebuilds system** - Runs `nixos-rebuild switch` with the correct flake configuration

### Usage

```bash
# For desktop
sudo ./scripts/setup-host.sh desktop

# For Framework 13 laptop
sudo ./scripts/setup-host.sh framework13
```

### When to use

- After installing NixOS on a new machine
- When partition labels don't match the hardware configuration
- When switching to this flake-based configuration for the first time

### Requirements

- Must be run as root (uses `sudo`)
- Dotfiles repo must be cloned locally
- NixOS must already be installed and bootable
