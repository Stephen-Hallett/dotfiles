{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    programs.zsh.initContent = ''
      copyfile() {
        emulate -L zsh
        clipcopy $1
      }
    '';

    programs.bash.initExtra = ''
      copyfile() {
        emulate -L zsh
        clipcopy $1
      }
    '';
  };
}
