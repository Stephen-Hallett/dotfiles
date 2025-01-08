{
  pkgs,
  lib,
  default,
  ...
}:
{
  imports = [ ./../core/home.nix ];

  home = {
    username = "${default.user}";
    homeDirectory = "/home/${default.user}";
  };
}
