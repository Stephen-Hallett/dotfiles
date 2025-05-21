{ pkgs, ... }: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "stephenhallett";
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    brews = [ "mas" "python@3.10" "python@3.11" "python@3.12" "python@3.13" ];
    casks = [
      # ----- General -----
      "postman"
      "orbstack"
      "vlc"
      "rstudio"
      "visual-studio-code"
      "git-credential-manager"
      "firefox"
    ];
    masApps = {
      # "Notability" = 360593530;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
