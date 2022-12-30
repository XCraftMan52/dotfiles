{
  config,
  pkgs,
  lib,
  ...
}: {
  services.openssh = {
    enable = true;
    permitRootLogin = lib.mkForce "no";
    openFirewall = true;
    forwardX11 = false;
    useDns = false;
    ports = [22];
    passwordAuthentication = lib.mkForce true; # false
    kbdInteractiveAuthentication = lib.mkDefault false;
#     hostKeys = [
#       {
#         bits = 4096;
#         path = "/etc/ssh/ssh_host_rsa_key";
#         type = "rsa";
#       }
#       {
#         path = "/etc/ssh/ssh_host_ed25519_key";
#         type = "ed25519";
#       }
#     ];
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [
      "127.0.0.0/8"
      "10.0.0.0/8"
      "192.168.0.0/16"
    ];
  };
}
