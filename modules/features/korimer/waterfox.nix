{ den, ... }:
{
  den.aspects.korimer.provides.waterfox = {
    includes = [
      den.aspects.flatpak
      den.aspects.korimer.provides.waterfox.provides.defaultBrowser
    ];

    nixos = {
      services.flatpak.packages = [ "net.waterfox.waterfox" ];
    };

    provides.defaultBrowser.homeManager = {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "waterfox.desktop";
          "x-scheme-handler/http" = "waterfox.desktop";
          "x-scheme-handler/https" = "waterfox.desktop";
          "x-scheme-handler/about" = "waterfox.desktop";
          "x-scheme-handler/unknown" = "waterfox.desktop";
        };
      };
    };
  };
}
