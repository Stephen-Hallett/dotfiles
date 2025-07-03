{ pkgs, config, ... }: {
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  environment.systemPackages = with pkgs; [ vim mkalias R ];

  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [ nerd-fonts.symbols-only fantasque-sans-mono ];
}
