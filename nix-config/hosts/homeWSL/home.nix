# Specific config for my home wsl, inherits personal (and subsequently common & core) packages

{
  pkgs,
  ...
}:
{
  imports = [ 
    ./../personal/home.nix 
  ];

  home = {
    packages = with pkgs; [
      glibc
    ];
  };
}
