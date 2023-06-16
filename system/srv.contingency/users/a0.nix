{ pkgs, ... }: {
  users.users.a0 = {
    isNormalUser = true;
    home = "/home/admin0";
    extraGroups = [ "wheel" "docker" ];
  };
}
