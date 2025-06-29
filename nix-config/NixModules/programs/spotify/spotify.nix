{ lib, config, inputs, pkgs, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  options = {
    nix-config.spotify.enable = lib.mkEnableOption "enable spotify";
  };

  config = lib.mkIf config.nix-config.spotify.enable {
    programs.spicetify = {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [ shuffle ];
      enabledCustomApps = with spicePkgs.apps; [ newReleases ncsVisualizer ];
      enabledSnippets = with spicePkgs.snippets; [ pointer ];

      theme = {
        name = "custom";
        src = ./theme;
      };
      colorScheme = "catppuccin-macchiato-green";
    };

  };
}
