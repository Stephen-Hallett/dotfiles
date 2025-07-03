{ lib, ... }: {
  options = {
    core-packages.shellfunctions.enable =
      lib.mkEnableOption "enable shell functions";
  };
  imports = [ ./setenv.nix ./activate.nix ./copyfile.nix ];
}
