{ pkgs, ... }: {
  nix-homebrew = { user = "stephen"; };

  homebrew = {
    casks = [
      # ----- General -----
      "google-chrome"
      "postman"
      "orbstack"
      "rstudio"
      "zoom"
      "spotify"
      "discord"
      # ----- Personal -----
      "ultimaker-cura"
      "jagex"
      "runelite"
      "autodesk-fusion"
      "arduino-ide"
      "tailscale"
    ];
    masApps = {
      "Notability" = 360593530;
      "Xcode" = 497799835;
      "Infuse" = 1136220934;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
