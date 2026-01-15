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
      # ----- Personal -----
      "ultimaker-cura"
      "jagex"
      "runelite"
      "arduino-ide"
      "nextcloud"
      "moonlight"
      "creality-print"
      "league-of-legends"
      "cursor"
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
