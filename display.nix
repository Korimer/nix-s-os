{config, ...}: {
  #boot.extraModprobeConfig = ''
  #    options nvidia_modeset vblank_sem_control=0 nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
  #    '';
  #boot.kernelModules = ["nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia"];
  #boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  services.xserver = {
  #  enable = true;
    videoDrivers = [ "nvidia" ]; 
  };

  hardware.graphics = {
    enable = true;
  #  enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; #without this after suspend was black screen without cursor; when true, cursor appears
  #    powerManagement.finegrained = false;
    open = true;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
