{ pkgs, lib, config, ... }: {
  options = {
    wsl-packages.homebrew.enable = lib.mkEnableOption "enable homebrew";
  };

  config = lib.mkIf config.wsl-packages.homebrew.enable {
    home.activation.homebrew = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      export PATH=${pkgs.curl}/bin:$PATH
      ${pkgs.bash}/bin/bash ${./brew.sh}
    '';

    programs.zsh.initContent = ''
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      export HOMEBREW_GIT_PATH=${pkgs.git}/bin/git
    '';
  };
}
