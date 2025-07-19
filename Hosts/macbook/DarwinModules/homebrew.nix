{ pkgs, ... }: {
  nix-homebrew = {
    user = "stephen";
    autoMigrate = false;
  };

  homebrew = {
    brews = [ "postgresql@17" ];
    casks = [
      # ----- General -----
      "zoom"
      "spotify"
      "discord"
      # ----- Personal -----
      "ultimaker-cura"
      "jagex"
      "runelite"
      "autodesk-fusion"
      "arduino-ide"
      "nextcloud"
    ];
    masApps = {
      "Notability" = 360593530;
      "Xcode" = 497799835;
      "Infuse" = 1136220934;
      "Moonlight" = 1000551566;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
