{
  description = "Nix configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Nix darwin
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-darwin
    , nix-homebrew, spicetify-nix, stylix, ... }@inputs:
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
            inputs.stylix.homeModules.stylix
            machineModule
          ];
        };
    in {
      homeConfigurations = {
        # HomePC
        "${homePC.user}@${homePC.hostname}" =
          mkHomeConfig ./Hosts/homeWSL/home.nix "x86_64-linux";
        # Macbook
        "${macbook.user}@${macbook.hostname}" =
          mkHomeConfig ./Hosts/macbook/home.nix "aarch64-darwin";
        # Work WSL
        "${work.user}" = mkHomeConfig ./Hosts/workWSL/home.nix "x86_64-linux";
        "${workMac.user}" =
          mkHomeConfig ./Hosts/workMac/home.nix "aarch64-darwin";
        "stephen@stevohome" =
          mkHomeConfig ./Hosts/homeNix/home.nix "x86_64-linux";
      };

      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          modules = [
            ./Hosts/macbook/configuration.nix
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };

        "work" = nix-darwin.lib.darwinSystem {
          modules = [
            ./Hosts/workMac/configuration.nix
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };
      };

      nixosConfigurations = {
        stevohome = nixpkgs.lib.nixosSystem rec {
          inherit specialArgs;
          modules = [
            spicetify-nix.nixosModules.default
            stylix.nixosModules.stylix
            ./Hosts/homeNix/configuration.nix
          ];
        };

      };
    };
}

