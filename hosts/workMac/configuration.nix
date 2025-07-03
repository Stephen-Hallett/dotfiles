{ pkgs, config, ... }: {
  imports = [ ./DarwinModules ../../DarwinModules ];
  environment.systemPackages = with pkgs; [ ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "stephenhallett";
}
