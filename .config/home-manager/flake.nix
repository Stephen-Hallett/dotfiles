{
  description = "Home Manager configuration of stevo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { 
    self, 
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
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
        inherit inputs personal homePC macbook work;
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
        user = "stevo";
        hostname = "SWAGGERMUFFIN"; # My dad asked me for a hostname when I was 12
      };

      macbook = {
        user = "stephen";
        hostname = "Stephens-MacBook-Pro.local";
      };

      work = {
        user = "stephen";
      };
    
    in
    {
      homeConfigurations = {
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
            ./modules
          ];
        };
      };
    };
}





