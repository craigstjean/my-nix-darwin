# update home-manager channel
nix-channel --update

# update nixpkgs, nix-darwin, and home-manager
nix flake update

# rebuild
./rebuild.sh

