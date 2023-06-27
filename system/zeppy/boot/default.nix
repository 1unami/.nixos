{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amd_pstate=active" "vfio-pci.ids=1002:164c,1002:1637" ];

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
