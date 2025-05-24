{ pkgs-unstable, lib, config, ... }: {
  options = { nix-config.neovim.enable = lib.mkEnableOption "enable neovim"; };

  config = lib.mkIf config.nix-config.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = false;
      package = pkgs-unstable.neovim-unwrapped;
    };
  };
}
