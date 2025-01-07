{pkgs, ...}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "stephen";
    autoMigrate = true;
  };
}