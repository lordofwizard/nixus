# Nixus - Modular NixOS Configuration

Minimal, modular NixOS setup with flakes, Home Manager, Hyprland, and nixvim.

## Tree
```
nixus/
├── flake.nix
├── hosts/
│  └── kyoichi/
│     ├── configuration.nix
│     ├── hardware-configuration.nix
│     └── home.nix
├── modules/
│  └── nixvim/
│     └── default.nix
└── README.md
```

## Build
```bash
sudo nixos-rebuild switch --flake .#kyoichi
nix flake update
home-manager switch --flake .#kyoichi
sudo nixos-rebuild switch --flake .#kyoichi --rollback
```

## Notes
- Add more hosts under `hosts/<name>` and add them to `flake.nix`
- nixvim is global under `modules/nixvim` and can be imported by any host
