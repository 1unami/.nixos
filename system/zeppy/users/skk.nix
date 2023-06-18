{ pkgs, ... }: {
  users.users.skk = {
    isNormalUser = true;
    home = "/home/commander";
    shell = pkgs.fish;
    passwordFile = "/@/skk.pass";
    extraGroups = [ "wheel" "audio" ];
  };

  users.extraUsers.skk = {
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
  };
}
