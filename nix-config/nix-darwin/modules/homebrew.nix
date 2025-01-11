{pkgs, ...}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "stephen";
    autoMigrate = true;
  };

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
      "Dropover" = 1355679052;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}