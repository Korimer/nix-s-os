{ den, ... }:
{
  den.aspects.korimer.provides.waterfox = {
    includes = [
      den.aspects.flatpak
      #den.aspects.korimer.provides.waterfox.provides.defaultBrowser
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

    provides.wireguard = {
      includes = [
        den.aspects.firejail
        den.aspects.korimer.provides.wireguard
      ];

      nixos = { pkgs, lib, ... }:
      let
        waterfoxJailed = pkgs.makeDesktopItem {
          name = "waterfox-firejail";
          desktopName = "Waterfox (CSU VPN)";
          exec = "waterfox-firejail %U";
          icon = "waterfox";
          categories = [ "Network" "WebBrowser" ];
          startupNotify = true;
          terminal = false;
          mimeTypes = [
            "text/html"
            "text/xml"
            "application/xhtml+xml"
            "x-scheme-handler/http"
            "x-scheme-handler/https"
          ];
        };
      in
      {
        programs.firejail = {
          wrappedBinaries.waterfox-firejail = {
            executable = "${lib.getBin pkgs.waterfox}/bin/waterfox";
            profile = "${pkgs.waterfox}/etc/firejail/waterfox.profile";
          };
        };
      };
    };
  };
}
