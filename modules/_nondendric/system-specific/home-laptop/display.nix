{...}: {
  #boot.extraModprobeConfig = ''
  #    options nvidia_modeset vblank_sem_control=0 nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
  #    '';
  #boot.kernelModules = ["nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia"];
  #boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
