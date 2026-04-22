{
  flake.modules.nixos.core = 
  { pkgs, ... }:
  {
    users.users.Administrator.isSystemUser = true;
    users.users.Administrator.group = "Administrator";
    users.groups.Administrator = {};

    system.activationScripts.setNixConfigPerms = {
      text = ''
        chgrp wheel /etc/nixos -R
        chmod 775 /etc/nixos -R
        '';
    };

    users.defaultUserShell = pkgs.zsh;

    users.groups.korimer = {};
    users.users.korimer = {
      createHome = true;
      group = "korimer";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio"];
      description = "the goat";
      password = "lol";
    };
  };
}
