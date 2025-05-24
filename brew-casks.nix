{ pkgs, lib, inputs, ... }:

let
  user = "craig";
in
{
  users.users.craig = {
    name = "craig";
    home = "/Users/craig";
  };

  system.primaryUser = "craig";

  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true;
    cleanup = "uninstall";
    upgrade = true;
  };
  homebrew.taps = [
    "d12frosted/homebrew-emacs-plus"
  ];
  homebrew.brews = [
    "go"
    "libvterm"
    "micromamba"
    "mlx"

    {
      name = "d12frosted/emacs-plus/emacs-plus@30";
      args = [
        "with-imagemagick"
        "with-modern-papirus-icon"
      ];
    }
  ];
  homebrew.casks = [
    "alfred"
    "bartender"
    "rectangle-pro"
    "commander-one"

    "obsidian"
    "bbedit"
    "sublime-text@dev"
    "beyond-compare"
    "lm-studio"
    "claude"
    "drawio"
    "excalidrawz"
    "mactex"
    "hex-fiend"

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

