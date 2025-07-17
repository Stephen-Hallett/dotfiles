{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    programs.zsh.initContent = ''
      activate() {
        source "$1/bin/activate"
      }
    '';

    programs.bash.initExtra = ''
      activate() {
        source "$1/bin/activate"
      }
    '';
  };
}
