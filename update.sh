# update home-manager channel
nix-channel --update

# update nixpkgs, nix-darwin, and home-manager
nix flake update

# update npm
cd npm
node2nix -i node-packages.json
cd ..

# rebuild
./rebuild.sh

