{ lib, config, pkgs, ... }: {
  # Omarchy specific config
  config = {
    targets.genericLinux.enable = true;
    programs.zsh = {
      initExtra = ''
        # Omarchy does not ship a zsh rc in v2.1.x; keep PATH and init in HM/zshrc.
        # If you need Omarchy CLI tools on PATH:
        export PATH="$HOME/.local/share/omarchy/bin:$PATH"
      '';
    };
  };
}
