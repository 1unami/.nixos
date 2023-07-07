{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amd_pstate=active" "amdgpu.ppfeaturemask=0xfff7ffff" "vfio-pci.ids=10de:1401,10de:0fba" ];
  boot.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "Bliss (default)" {
	  #insmod cryptodisk
	  #insmod luks2
	  #insmod luks
	  #insmod lvm

          #cryptomount hd0,gpt2

          set SOURCE_NAME="blissos"
	  search --set=root --file /$SOURCE_NAME/kernel
	  linux /$SOURCE_NAME/kernel FFMPEG_CODEC=1 FFMPEG_PREFER_C2=1 root=/dev/ram0 SRC=/$SOURCE_NAME ANGLE=1 ENABLE_ELEVEN=0 ENABLE_TSCAL=0 ENABLE_PHONOGRAPH=0 ENABLE_GAMESPACE=0
	  initrd /$SOURCE_NAME/initrd.img

	  #search --set=drive1 --fs-uuid 36CB-7B6
	  #linux ($drive1)//bliss/kernel cryptdevice=UUID=45636029-cc5e-469d-99c4-cecbf57a2153:cryptlvm FFMPEG_CODEC=1 FFMPEG_PREFER_C2=1 root=/dev/ram0 SRC=/blissos
	  #initrd ($drive1)//bliss/initrd.img
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
