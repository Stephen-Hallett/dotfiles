{ pkgs, ... }: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    brews = [ "mas" "python@3.10" "python@3.11" "python@3.12" "python@3.13" ];
    casks = [
      # ----- General -----
      "visual-studio-code"
      "raycast"
      "firefox"
      "google-chrome"
      "font-fantasque-sans-mono-nerd-font"
      "postman"
      "orbstack"
      "rstudio"
    ];
    masApps = { };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
