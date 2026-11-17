{ inputs, pkgs, ... }:
{
  #imports = [ inputs.waveforms.nixosModules.default ];
  #nixpkgs.overlays = [ inputs.waveforms.overlay ];
  #services.udev.packages = [ pkgs.adept2-runtime ];
  #environment.systemPackages = [ pkgs.waveforms ];
  #users.groups.plugdev = { };
}
