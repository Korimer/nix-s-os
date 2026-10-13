{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  #home-manager = {
  #  systemd.user.enable = true;
  #};
}
