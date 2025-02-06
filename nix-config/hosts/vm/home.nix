# Config for packages shared by personal machines, inherits common (and subsequently core) packages

{
  pkgs,
  ...
}:
{
  imports = [ 
    ./../core/home.nix 
  ];

  home = {
    packages = with pkgs; [
      docker
      docker-compose
    ];
  };
}
