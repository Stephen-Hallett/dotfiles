# Config for packages shared by all development machines (non VM/edge devices)

{ pkgs, ... }: {
  imports = [ ./../core/home.nix ];

  common-packages = { tmux.enable = true; };

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
      nettools
      uv
      typescript
      just
      nodejs_22
      nodemon
      yarn
      vsce
      nixfmt-classic
      hadolint
      gh

      docker
      docker-compose
      docker-buildx
    ];

    sessionVariables = {
      #LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/"; # fix the problem of dynamic link in python package
    };
  };
}
