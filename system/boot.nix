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
      device = "/dev/vda2";
      preLVM = true;
    };
  };
}
