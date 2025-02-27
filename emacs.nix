{ config, pkgs, ... }:

let
  user = "craig";
  emacs-overlay = import (fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  });
  my-emacs = pkgs.emacs29.override {
    withNativeCompilation = true;
    withSQLite3 = true;
    withTreeSitter = true;
    withImageMagick = true;
    withWebP = true;
  };
  my-emacs-with-packages = (pkgs.emacsPackagesFor my-emacs).emacsWithPackages (epkgs: with epkgs; [
    vterm
    multi-vterm
    treesit-grammars.with-all-grammars
  ]);
in {
  programs.emacs = {
    enable = true;
    package = my-emacs-with-packages;
  };

  home.packages = [
    pkgs.emacs-all-the-icons-fonts
    (pkgs.aspellWithDicts (d: [d.en]))
    pkgs.wordnet
  ];
}

