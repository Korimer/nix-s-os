{pkgs, ...}: 
let
  custom_astro = pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; };
  chosen_theme = 
    "${custom_astro}/share/sddm/themes/sddm-astronaut-theme";
in {
  services.displayManager = {
    autoLogin = {
      enable = false;
      user = null;
    };
    sddm = {
      enable = true;
      theme = chosen_theme;
      extraPackages = [
        pkgs.kdePackages.qt5compat
        custom_astro
      ];
    };
  };
}
