{ pkgs, config, ... }: {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = null;
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.alacritty
          pkgs.mkalias
          pkgs.discord
          pkgs.vscode
          pkgs.spotify
          pkgs.R
          pkgs.python312
        ];

      fonts.packages = [
        (pkgs.nerd-fonts.fantasque-sans-mono)
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
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
        onActivation.cleanup = "zap";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
}