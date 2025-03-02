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
      "python@3.11"
      "python@3.12"
      "python@3.13"
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
      "Infuse" = 1136220934;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
