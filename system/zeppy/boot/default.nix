{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
  };

  boot.initrd.luks.devices = {
    luks_system = {
      # cryptsetup config /dev/xxxx --label luks_system
      device = "/dev/disk/by-label/luks_system";
      preLVM = true;
    };
  };
}
