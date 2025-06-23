{ lib, ... }: {
  options = {
    core-packages.shellfunctions.enable =
      lib.mkEnableOption "enable shell functions";
  };
  imports = [ ./setenv/setenv.nix ];
}
