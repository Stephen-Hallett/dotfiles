{
  lib,
  config,
  ...
}:
{
  options = {
    work-packages.git-work.enable = lib.mkEnableOption "enable git for work";
  };

  config = lib.mkIf config.work-packages.git-work.enable {
    programs.git =
      let
        username = "stephenhallett";
        email = "stephenhallett@kpmg.co.nz";
      in
      {
        userName = lib.mkForce "${username}";
        userEmail = lib.mkForce "${email}";

        extraConfig = {
          credential = {
            helper = "/usr/local/share/gcm-core/git-credential-manager";
          };
          "credential \"https://dev.azure.com\"" = {
            useHttpPath = true;
          };
          "user \"https://github.com/kpmg-nz-emu\"" = {
            email = "${email}";
          };
          "credential \"https://github.com/kpmg-nz-emu\"" = {
            username = "${username}";
          };
        };
      };
  };

}