{
  description = "Nix configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Nix darwin
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # NixOS
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-darwin
    , nix-homebrew, proxmox-nixos, ... }@inputs:
    let
      inherit (self) outputs;

      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable { config.allowUnfree = true; };
        inherit inputs personal;
      };

      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable { config.allowUnfree = true; };
        inherit inputs personal homePC macbook work default;
      };

      personal = {
        timeZone = "Pacific/Auckland";
        defaultLocale = "en_NZ.UTF-8";
        city = "Auckland";

        # Used for gitconfig
        gitUser = "Stephen-Hallett";
        gitEmail = "stevohallett@gmail.com";
      };

      homePC = {
        user = "stephen";
        hostname =
          "SWAGGERMUFFIN"; # My dad asked me for a hostname when I was 12
      };

      macbook = {
        user = "stephen";
        hostname = "Stephens-MacBook-Pro.local";
      };

      work = { user = "stephen"; };

      workMac = { user = "stephenhallett"; };

      default = { user = builtins.getEnv "USER"; };

      mkHomeConfig = machineModule: system:
        home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs;
          pkgs = import nixpkgs { inherit system; };

          modules = [
            ./HomeManagerModules
            inputs.nixvim.homeManagerModules.nixvim
            machineModule
          ];
        };
    in {
      homeConfigurations = {
        # HomePC
        "${homePC.user}@${homePC.hostname}" =
          mkHomeConfig ./hosts/homeWSL/home.nix "x86_64-linux";
        # Macbook
        "${macbook.user}@${macbook.hostname}" =
          mkHomeConfig ./hosts/macbook/home.nix "aarch64-darwin";
        # Work WSL
        "${work.user}" = mkHomeConfig ./hosts/workWSL/home.nix "x86_64-linux";
        "${workMac.user}" =
          mkHomeConfig ./hosts/workMac/home.nix "aarch64-darwin";
        # Arm machines
        "root@DietPi" = mkHomeConfig ./hosts/core/home.nix "aarch64-linux";
        "pi@raspberrypi" = mkHomeConfig ./hosts/core/home.nix "aarch64-linux";
        "stephen@media" = mkHomeConfig ./hosts/vm/home.nix "aarch64-linux";
        "stephen@nixos" = mkHomeConfig ./hosts/vm/home.nix "x86_64-linux";
      };

      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/common/darwin-modules/modules.nix
            ./hosts/macbook/configuration.nix
            ./hosts/macbook/darwin-modules/modules.nix
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };

        "work" = nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/common/darwin-modules/modules.nix
            ./hosts/workMac/configuration.nix
            ./hosts/workMac/darwin-modules/modules.nix
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };
      };

      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem rec {
          inherit specialArgs;
          modules = [
            proxmox-nixos.nixosModules.proxmox-ve
            ({ lib, pkgs, ... }: {
              nixpkgs.overlays = [ proxmox-nixos.overlays.x86_64-linux ];
            })

            ./hosts/homelab/configuration.nix
          ];
        };
      };
    };
}

