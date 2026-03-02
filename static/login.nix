{pkgs, ...}: 
{ 
  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
      greeters.gtk = {
        enable = true;
        extraConfig = ''
          [greeter]
          background=/etc/nixos/fauux_bg.gif
        '';
      };
    };
  };
}

