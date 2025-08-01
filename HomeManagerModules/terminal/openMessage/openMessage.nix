{ pkgs, lib, config, ... }: {
  options = {
    core-packages.open-message.enable =
      lib.mkEnableOption "enable open message";
  };

  config = lib.mkIf config.core-packages.open-message.enable {
    programs.zsh.initContent = ''
      ${builtins.readFile ./open_message.sh}
      echo -e "\033[1;32m$message\033[0m"
    '';
  } // lib.mkIf (!config.core-packages.open-message.enable) {
    # programs.zsh.initContent = ''
    #   ${pkgs.neofetch}/bin/neofetch
    # '';
    programs.fastfetch = { enable = true; };
  };
}
