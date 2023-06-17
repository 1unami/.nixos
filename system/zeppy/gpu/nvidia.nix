{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;

  boot.kernelParams = [ "module_blacklist=amdgpu" ];
}
