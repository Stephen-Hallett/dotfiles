{ inputs, pkgs, pkgs-unstable, lib, config, ... }: {
  imports = [ ./theme.nix ./opts.nix ./autocmds.nix ];

  options = {
    core-packages.nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf config.core-packages.nixvim.enable {
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      package =
        inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.neovim-unwrapped;
      colorschemes.catppuccin.enable = true;

      extraPackages = with pkgs-unstable.vimPlugins;
        [

        ];

      plugins.lsp.servers.pylsp.enable = true;
    };
  };
}
