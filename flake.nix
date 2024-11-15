{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
        url = "github:nix-community/home-manager/release-24.05";
        # The `follows` keyword in inputs is used for inheritance.
        # Here, `inputs.nixpkgs` of home-manager is kept consistent with
        # the `inputs.nixpkgs` of the current flake,
        # to avoid problems caused by different versions of nixpkgs.
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
        insaneduck-nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
                ./config/configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    # TODO replace siva with your own username
                    home-manager.users.siva = import ./home/home.nix;
                    # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
                }
            ];
        };
    };
  };
}
