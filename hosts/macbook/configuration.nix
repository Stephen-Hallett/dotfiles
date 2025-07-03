{ pkgs, config, ... }: {
  imports = [ ../../DarwinModules ./DarwinModules ];

  environment.systemPackages = with pkgs; [ tailscale ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "stephen";
}
