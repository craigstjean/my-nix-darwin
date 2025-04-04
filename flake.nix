{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    user = "craig";
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
          pkgs.p7zip
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Let nix-darwin manage Nix, not Determinate
      nix.enable = false;
    };
  in
  {
    users.users.craig = {
      name = "craig";
      home = "/Users/craig";
    };

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Craigs-MacBook-Pro-2
    darwinConfigurations."Craigs-MacBook-Pro-2" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./brew-casks.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.users.craig = import ./home.nix;
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
