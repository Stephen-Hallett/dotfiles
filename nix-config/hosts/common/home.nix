# Config for packages shared by all development machines (non VM/edge devices)

{
  pkgs,
  ...
}:
{
  imports = [ ./../core/home.nix ];

  common-packages = {
    tmux.enable = true;
  };

  home = {
    packages = with pkgs; [
      wget
      font-awesome
      azure-cli
      azure-functions-core-tools
      terraform
      sqlite
      protobuf
      coreutils
      gcc
      gcc-unwrapped
      stdenv.cc.cc.lib
      gnumake
      cmake
      zlib
    ];

    sessionVariables = {
      #LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/"; # fix the problem of dynamic link in python package
    };
  };
}
