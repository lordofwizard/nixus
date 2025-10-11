# Nixus - Minimal NixOS Configuration

A minimal NixOS configuration using flakes with home-manager integration.

## Tree Structure

```
nixus/
├── flake.nix                 # Main flake configuration
├── configuration.nix         # NixOS system configuration
├── hardware-configuration.nix # Hardware-specific settings
├── home.nix                  # Home Manager configuration
└── README.md                 # This file
```

## Features

- Flake-based NixOS configuration
- User: `lordofwizard` with wheel and networkmanager groups
- System packages: vim, btop, pfetch
- Home Manager integration
- SSH access enabled
- NetworkManager for networking

## Usage

### Build and Switch Configuration

To build and switch to this configuration:

```bash
# Build the system
sudo nixos-rebuild switch --flake .#nixus

# Or build without switching (dry run)
sudo nixos-rebuild build --flake .#nixus
```

### Update Flake Inputs

To update the flake inputs (nixpkgs, home-manager):

```bash
nix flake update
```

### Rebuild Home Manager

To rebuild just the home-manager configuration:

```bash
home-manager switch --flake .#lordofwizard
```

### Rollback

To rollback to the previous generation:

```bash
sudo nixos-rebuild switch --flake .#nixus --rollback
```

## First Time Setup

1. Clone this repository to `/etc/nixos/` or your preferred location
2. Run `sudo nixos-rebuild switch --flake .#nixus`
3. The system will be configured with the specified user and packages

## Notes

- Make sure to run `nixos-generate-config` on your actual hardware to generate proper `hardware-configuration.nix`
- SSH keys should be added to the user configuration for secure access
- The configuration assumes a UEFI system with systemd-boot
