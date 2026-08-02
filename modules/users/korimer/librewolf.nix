{ den, ... }:
{
  den.aspects.korimer.provides.librewolf = {

    includes = [ den.aspects.korimer.provides.librewolf.provides.defaultBrowser ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.librewolf ];

      # Little bit jank workaround to auto-install extensions without banking on the NUR
      environment.etc."librewolf/policies/policies.json".text = ''
        {
          "policies": {
            "ExtensionSettings": {
              "uBlock0@raymondhill.net": {
                "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi",
                "installation_mode": "force_installed",
                "default_area": "navbar"
              },
              "{446900e4-71c2-419f-a6a7-df9c091e268b}": {
                "install_url": "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi",
                "installation_mode": "force_installed",
                "default_area": "navbar"
              },
              "vim-vixen@i-beam.org": {
                "install_url": "https://addons.mozilla.org/firefox/downloads/latest/vim-vixen/latest.xpi",
                "installation_mode": "force_installed",
                "default_area": "navbar"
              }
              "Vimium": {
                "install_url": "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi",
                "installation_mode": "force_installed",
                "default_area": "navbar"
              }
            }
          }
        }
      '';
    };

    provides.defaultBrowser.homeManager = {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "librewolf.desktop";
          "x-scheme-handler/http" = "librewolf.desktop";
          "x-scheme-handler/https" = "librewolf.desktop";
          "x-scheme-handler/about" = "librewolf.desktop";
          "x-scheme-handler/unknown" = "librewolf.desktop";
        };
      };
    };
  };
}
