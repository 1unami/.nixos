{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amd_pstate=active" "amdgpu.ppfeaturemask=0xfff7ffff" ];
  #boot.kernelModules = [ "vfio_pci" ];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        insmod lvm

        menuentry "Bliss (default)" {
          set SOURCE_NAME="bliss" search --set=root --file /$SOURCE_NAME/kernel
	  linux /$SOURCE_NAME/kernel FFMPEG_CODEC=1 FFMPEG_PREFER_C2=1 root=/dev/ram0 SRC=/$SOURCE_NAME
	  initrd /$SOURCE_NAME/initrd.img
	}
      '';
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
