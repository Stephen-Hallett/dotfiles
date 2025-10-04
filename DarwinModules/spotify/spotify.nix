{ lib, config, inputs, pkgs, pkgs-unstable, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  options = {
    darwin-packages.spotify.enable = lib.mkEnableOption "enable spotify";
  };

  config = lib.mkIf config.darwin-packages.spotify.enable {
    programs.spicetify = {
      enable = true;

      spotifyPackage = pkgs-unstable.spotify;

      enabledExtensions = with spicePkgs.extensions; [ shuffle ];
      enabledCustomApps = with spicePkgs.apps; [ newReleases ncsVisualizer ];
      enabledSnippets = with spicePkgs.snippets; [ ];

      theme = {
        name = "custom";
        src = ./theme;
      };
      colorScheme = "catppuccin-macchiato-green";
    };
  };
}
