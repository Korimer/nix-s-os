{pkgs, ...}: 
{ 
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk.enable = true;
  };
  programs.zsh.loginShellInit = "sudo kbd_mode -s";
}

#let
#  custom_astro = pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; };
#  chosen_theme = 
#    "${custom_astro}/share/sddm/themes/sddm-astronaut-theme";
#in {
#  services.displayManager = {
#    autoLogin = {
#      enable = false;
#      user = null;
#    };
#    sddm = {
#      enable = true;
#      wayland.enable = true;
#      theme = chosen_theme;
#      extraPackages = [
#        pkgs.kdePackages.qt5compat
#        custom_astro
#      ];
#    };
#  };
#}
