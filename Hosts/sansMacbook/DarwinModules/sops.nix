{ pkgs, config, ... }:
let user = config.system.primaryUser;
in {
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      sshKeyPaths =
        [ "/etc/ssh/ssh_host_ed25519_key" "/Users/${user}/.ssh/id_ed25519" ];
      keyFile = "/Users/${user}/Library/Application Support/sops/age/keys.txt";
      generateKey = false;
    };

    secrets = { tailscale = { }; };
  };

}
