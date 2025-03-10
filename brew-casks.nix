{ pkgs, lib, inputs, ... }:

let
  user = "craig";
in
{
  users.users.craig = {
    name = "craig";
    home = "/Users/craig";
  };

  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true;
    cleanup = "uninstall";
    upgrade = true;
  };
  homebrew.brews = [
    "libvterm"
    "micromamba"
    "mlx"
  ];
  homebrew.casks = [
    "alfred"
    "bartender"
    "rectangle-pro"
    "commander-one"

    "bbedit"
    "sublime-text@dev"
    "beyond-compare"
    "lm-studio"
    "claude"
    "drawio"
    "excalidrawz"
    "mactex"

    "jetbrains-toolbox"
    "cursor"

    "microsoft-teams"
    "discord"

    "deezer"
    "spotify"
    "vlc"
    "handbrake"

    "affinity-photo"
    "affinity-designer"
    "affinity-publisher"

    "steam"
    "obs"

    "miniconda"
  ];
}

