{ config, pkgs, ... }:

let
  npm = (pkgs.callPackage ./npm/default.nix {});
in
{
  imports = [
    ./emacs.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "craig";
  home.homeDirectory = "/Users/craig";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    # not available for aarch64-darwin
    #pkgs.libvterm
    #pkgs.obs-studio

    #pkgs.conda
    #pkgs.micromamba

    # Essential
    pkgs.git
    pkgs.neovim

    # JS
    pkgs.nodejs_22
    pkgs.nodePackages.js-beautify
    pkgs.nodePackages.prettier
    pkgs.stylelint
    pkgs.vscode-langservers-extracted
    pkgs.nodePackages.vscode-json-languageserver
    pkgs.typescript
    pkgs.prisma
    pkgs.pnpm
    pkgs.deno
    pkgs.vue-language-server
    pkgs.typescript-language-server
    # pkgs.nodePackages.claude-code

    # Fonts
    pkgs.powerline-fonts
    pkgs.powerline-symbols
    pkgs.vistafonts
    pkgs.dejavu_fonts
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.fira
    pkgs.fira-code
    pkgs.noto-fonts
    pkgs.roboto
    pkgs.source-code-pro
    pkgs.nerd-fonts.ubuntu
    pkgs.nerd-fonts.symbols-only

    # System Tools
    pkgs.bat
    pkgs.delta
    pkgs.dust
    pkgs.eza
    pkgs.fd
    pkgs.ffmpeg-full
    pkgs.fontconfig
    pkgs.fzf
    pkgs.gitui
    pkgs.gnuplot
    pkgs.graphviz-nox
    pkgs.kondo
    pkgs.mermaid-cli
    pkgs.imagemagick
    pkgs.jq
    pkgs.ngrok
    pkgs.node2nix
    pkgs.nushell
    pkgs.ollama
    pkgs.pandoc
    pkgs.qmk
    (pkgs.ripgrep.override { withPCRE2 = true; })
    pkgs.rlwrap
    pkgs.rustup
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.sqlite
    pkgs.stockfish
    pkgs.tmux
    pkgs.tokei
    pkgs.unzip
    pkgs.virtualenv
    pkgs.wget
    pkgs.zellij
    pkgs.zoxide

    # Go
    pkgs.go
    pkgs.air
    pkgs.golangci-lint
    pkgs.gore
    pkgs.gocode-gomod
    pkgs.gotools
    pkgs.gotests
    pkgs.gomodifytags
    pkgs.gopls
    pkgs.mprocs

    # C++
    pkgs.clang
    pkgs.clang-tools
    pkgs.cmake
    pkgs.cmake-language-server
    pkgs.ninja

    # Elixir
    pkgs.beam27Packages.elixir
    pkgs.beam27Packages.elixir-ls
    pkgs.beam27Packages.erlang-ls
    pkgs.beam27Packages.rebar3
    pkgs.erlang_nox

    # .NET
    pkgs.dotnet-sdk_9

    # Java
    pkgs.jdk
    pkgs.gradle
    pkgs.maven

    # Flutter / Dart
    pkgs.flutter

    # Misc
    pkgs.lua-language-server
    pkgs.mermaid-cli
    pkgs.nixfmt-classic

    # Custom NPM
    npm.marked
    npm."@anthropic-ai/claude-code"
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/craig/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}

