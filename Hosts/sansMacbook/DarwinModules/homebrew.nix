{ pkgs, ... }: {
  nix-homebrew = {
    user = "sanskruti";
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    brews = [ ];
    casks = [ "zoom" "nextcloud" ];
    masApps = {
      "Infuse" = 1136220934;
      # "Notability" = 360593530;
    };
  };
}
