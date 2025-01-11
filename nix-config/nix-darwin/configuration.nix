{ pkgs, config, ... }: {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = null;
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs;
        [ 
          vim
          mkalias
          R
          python312
        ];

      fonts.packages = with pkgs;
      [
        (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
        fantasque-sans-mono
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
}
