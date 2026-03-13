{ lib, pkgs, ... }:

  let envar = {
    PRIMARYUSER = "korimer";
  };

in {
  environment.variables = lib.mapAttrs (
      key: val:
      lib.mkDefault val
    )
    envar
  ;
  system.activationScripts.forceTmpfilesRun = ''
    ${pkgs.systemd}/bin/systemd-tmpfiles --create
  '';
} 
