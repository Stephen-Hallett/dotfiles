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
          alacritty
        ];

      fonts.packages = with pkgs;
      [
        (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
        fantasque-sans-mono
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          # ----- General -----
          "google-chrome"
          "postman"
          "docker"
          "vlc"
          "rstudio"
          "zoom"
          "spotify"
          "discord"
          "visual-studio-code"
          # ----- Personal -----
          "ultimaker-cura"
          "jagex"
          "autodesk-fusion"
          "arduino-ide"
        ];
        masApps = {
          "Notability" = 360593530;
          "Xcode" = 497799835;
        };
        onActivation.autoUpdate = false;
        onActivation.upgrade = false;
        onActivation.cleanup = "zap";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
}
