{
  pkgs,
  lib,
  ...
}:
{
  imports = [ ./../core/home.nix ];

  home = {
    packages = with pkgs; [
      wget
      font-awesome
      portaudio
      azure-cli
      azure-functions-core-tools
      terraform
      sqlite
      protobuf
    ];
  };
}
