{ pkgs, ... }: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
  };

  homebrew = {
    enable = true;
    brews = [ "mas" ];
    casks = [
      # ----- General -----
      "raycast"
      "firefox"
      "google-chrome"
      "rstudio"
      "notion"
      "zoom"
      "font-cousine-nerd-font"
      # ----- Study -----
      "microsoft-office"
      "openfortivpn"
      "zotero"
      # ----- Stephen Stuff -----
      "nextcloud"
    ];
    masApps = {
      "Notability" = 360593530;
      "Infuse" = 1136220934;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
