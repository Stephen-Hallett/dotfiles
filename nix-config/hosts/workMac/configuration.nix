{ pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ vim mkalias R ];

  fonts.packages = with pkgs; [ nerd-fonts.symbols-only fantasque-sans-mono ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "stephenhallett";
}
