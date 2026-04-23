{ config, ... }:
{
  flake.modules.nixosHosts.hope = {
    unstable = true;

  #  modules = [
  #    ./_nixos
  #  ]
  #  ++ (with config.flake.modules.nixos; [
  #    desktop
  #    dev
  #  ]);

  #  homeManagerModules = [
  #    ./_home
  #  ]
  #  ++ (with config.flake.modules.homeManager; [
  #    desktop
  #    ssh-hosts
  #  ]);
  };
}
