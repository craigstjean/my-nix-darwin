# my-nix-darwin

My reproducible system setup for macOS using Nix.

Uses:

- [Determinate nix-installer](https://github.com/DeterminateSystems/nix-installer)
- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [Homebrew](https://brew.sh/)
  - NOTE: I do not manually use `brew` for anything, and I only included this for casks that I cannot get with nixpkgs

## Features:

- Installs Nix and Homebrew
- Emacs overlay, which I use for Doom Emacs
- Homebrew integration for casks
  - `HOMEBREW_AUTO_UPDATE_SECS` set to only update once a day
- Custom npm packages
  - These are npm packages that are not in nixpkgs
  - Update by changing `npm/node-packages.json`, running `node2nix`, and adding the desired package(s) in home.nix

# Usage:

## Prerequisites

- Fork repo
- Change any reference to `craig` in:
  - flake.nix
  - home.nix
  - emacs.nix
  - brew-casks.nix
- Update `flake.nix` with your system hostname in place of `Craigs-MacBook-Pro-2`

## Installation

```sh
chmod +x setup.sh
./setup.sh
```

This will:

- Ensure XCode command line tools are installed
- Install Homebrew and add it to ZSH (via `~/.zprofile`)
- Install Nix
- Add home-manager
- Build the system

## Installing changes to `home.nix` or `brew-casks.nix`:

```sh
./rebuild.sh
```

## Updating installed packages:

```sh
./update.sh
```

