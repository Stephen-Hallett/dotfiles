{ pkgs, lib, config, ... }: {
  options = {
    nix-config.proxmox.enable = lib.mkEnableOption "enable proxmox";
  };

  config = lib.mkIf config.nix-config.proxmox.enable {
    services.proxmox-ve = {
      enable = true;
      ipAddress = "192.168.1.72";
    };
    networking.bridges.vmbr0.interfaces = [ "ens18" ];
    networking.interfaces.vmbr0.useDHCP = lib.mkDefault true;
    networking.firewall.allowedTCPPorts = [ 8006 ];
  };
}
