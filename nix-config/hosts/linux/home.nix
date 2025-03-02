# Specific config for linux distributions, inherits personal (and subsequently common & core) packages

{
  pkgs,
  ...
}:
{
  imports = [ 
  ];

  home = {
    packages = with pkgs; [
      nfs-utils
      usbutils
      pciutils
      cifs-utils
      # Docker
      docker
      docker-compose
      containerd
      docker-buildx
    ];
  };
}