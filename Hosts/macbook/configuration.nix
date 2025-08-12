{ pkgs, pkgs-unstable, config, ... }: {
  imports = [ ./DarwinModules ];

  environment.systemPackages = with pkgs; [ catppuccin-discord ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "stephen";
  networking.hostName = "StephensMacbook";
  networking.computerName = "Stephens Macbook";
}
