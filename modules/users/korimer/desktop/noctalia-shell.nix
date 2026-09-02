{ den, inputs, flake-root, ... }:
{
  flake-file.inputs.noctalia-shell.url = "github:noctalia-dev/noctalia-shell";

  den.aspects.korimer.provides.noctalia-shell.provides.full-noctalia-customizations = {
    includes = [
      # Customizations of my choice
      den.aspects.korimer.provides.noctalia-shell.provides.plugins
      den.aspects.korimer.provides.noctalia-shell.provides.bar
      # My custom niri config module
      den.aspects.niriconfig
      # System settings
      den.aspects.power
      den.aspects.networking
    ];

    nixos = { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        playerctl
        (mpv.override { scripts = [ pkgs.mpvScripts.mpris ]; })
        yt-dlp
        jq
        ffmpeg
        evtest
      ];

      niriconfig.noctaliastartup.text = ''
        spawn-at-startup "noctalia-shell"
      '';
      niriconfig.noctaliawallpaper.text = ''
        // Set the regular wallpaper on the backdrop.
        layer-rule {
          match namespace="^noctalia-wallpaper*"
          place-within-backdrop true
        }

        // Set transparent workspace background color so you see the backdrop at all times.
        layout {
          background-color "transparent"
        }

        // Optionally, disable the workspace shadows in the overview.
        overview {
          workspace-shadow {
            off
          }
        }
      '';
    };

    homeManager = {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia-shell = {
        enable = true;
        plugins = {
          sources = [
            {
              enabled = true;
              name = "Official Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
            {
              enabled = true;
              name = "Korimer ripoff noctalia plugins";
              url = "https://github.com/Korimer/noctalia-plugins";
            }
          ];
        };
      };
    };

    provides.plugins.homeManager.programs.noctalia-shell =
    let
      enableAll = list: builtins.listToAttrs (
        builtins.map
          (item: { name = item; value = {enabled = true;}; })
          list
      );
    in
    {
      plugins.states = enableAll [
        "custom-sticker"
        "catwalk"
        "activate-linux"
        "kaomoji-provider"
        "not-just-text"
        "giphy-search"
        "slowbongo"
        "todo"
        "privacy-indicator"
        "lyrics-fetch"
        "music-search"
      ];
      pluginSettings = {
        activate-linux = {
          customizeText = true;
          firstLine = " ";
          secondLine = " ";
        };
        not-just-text = {
          listEnabled = true;
          textFile = "${flake-root.path}/git-submodules/dotfiles/quotes/anni3/taglines.txt";
        };
        lyrics-fetch = {
          hideWhenEmpty = false;
        };
      };
    };

    provides.bar.homeManager.programs.noctalia-shell.settings.bar =
    {
      barType = "framed";
      widgets.left = [
        {
          id = "Launcher";
        }
        {
          id = "plugin:privacy-indicator";
        }
        {
          id = "Clock";
          formatHorizontal = "h:mm AP ddd, MMM dd";
        }
        {
          id = "SystemMonitor";
        }
        {
          id = "plugin:music-search";
        }
      ];
      widgets.center = [
        {
          id = "Workspace";
          showApplications = true;
          colorizeIcons = true;
        }
        {
          id = "plugin:lyrics-fetch";
        }
      ];
      widgets.right = [
        {
          id = "plugin:not-just-text";
        }
        {
          id = "Tray";
        }
        {
          id = "NotificationHistory";
        }
        {
          id = "Battery";
        }
        {
          id = "Volume";
        }
        {
          id = "Brightness";
        }
        {
          id = "ControlCenter";
        }
      ];
    };
  };
}
