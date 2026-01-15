{ personal, lib, config, ... }: {
  options = { core-packages.git.enable = lib.mkEnableOption "enable git"; };

  config = lib.mkIf config.core-packages.git.enable {
    programs.git = {
      enable = true;

      settings = {
        alias = { tree = "log --all --graph --decorate"; };
        user = {
          name = "${personal.gitUser}";
          email = "${personal.gitEmail}";
        };

        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        side-by-side = true;
      };
    };
  };
}
