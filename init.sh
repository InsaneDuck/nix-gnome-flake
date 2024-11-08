sudo nix-channel --list
sudo nix-channel --add https://channels.nixos.org/nixpkgs-unstable/ unstable
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade