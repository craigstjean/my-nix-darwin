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

    "microsoft-teams"

    "deezer"
    "spotify"

    "affinity-photo"
    "affinity-designer"
    "affinity-publisher"

    "steam"
  ];
}

