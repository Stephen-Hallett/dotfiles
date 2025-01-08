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
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { 
    self, 
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-darwin,
    nix-homebrew,
    ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system personal;
      };

      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
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
        hostname = "SWAGGERMUFFIN"; # My dad asked me for a hostname when I was 12
      };

      macbook = {
        user = "stephen";
        hostname = "Stephens-MacBook-Pro.local";
      };

      work = {
        user = "stephen";
      };

      default = {
        user = builtins.getEnv "USER";
      };

      coreConfig = username: {
        inherit extraSpecialArgs pkgs;
        modules = [
          ./hosts/core/home.nix
          ./HomeManagerModules
          inputs.nixvim.homeManagerModules.nixvim
        ];
        user = username; # Set the username dynamically
      };


    
    in
    {
      homeConfigurations = {
        # HomePC
        "${homePC.user}@${homePC.hostname}" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/homeWSL/home.nix
            ./HomeManagerModules
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        # Macbook
        "${macbook.user}@${macbook.hostname}" = 
          let
            system = "aarch64-darwin";
          in
          home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              inherit system;
            };

            extraSpecialArgs = {
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
              inherit inputs personal macbook;
            };

          modules = [
            ./hosts/macbook/home.nix
            ./HomeManagerModules
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        # Other users
        "root" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/core/home.nix
            ./HomeManagerModules
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        "${default.user}" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/core/home.nix
            ./hosts/default/home.nix
            ./HomeManagerModules
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };
      };

      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          modules = [ 
            ./nix-darwin/configuration.nix
            ./nix-darwin/modules/system.nix
            ./nix-darwin/modules/homebrew.nix
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };
      };
    };
}





