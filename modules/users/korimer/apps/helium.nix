{ inputs, den, ... }:
{
  flake-file.inputs.helium.url = "github:vikingnope/helium-browser-nix-flake";

  den.aspects.korimer.provides.helium = {
    includes = [den.aspects.korimer.provides.helium.provides.defaultBrowser];
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      #nixpkgs.overlays = [
      #  inputs.helium.overlays.default
      #];
      #environment.systemPackages = [
      #  pkgs.etcd
      #  pkgs.helium
      #];

      environment.etc."chromium/policies/managed/extensions.json".text = builtins.toJSON {
      ExtensionInstallForcelist = [
        "dbepggeogbaibhgnhhndojpepiihcmeb;https://clients2.google.com/service/update2/crx" # Vimium
        "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # Bitwarden
        "dhdgffkkebhmkfjojejmpbldmpobfkfo;https://clients2.google.com/service/update2/crx" # Tampermonkey
      ];
  };
    };

    provides.defaultBrowser.homeManager = {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "librewolf.desktop";
          "x-scheme-handler/http" = "helium.desktop";
          "x-scheme-handler/https" = "helium.desktop";
          "x-scheme-handler/about" = "helium.desktop";
          "x-scheme-handler/unknown" = "helium.desktop";
        };
      };
    };
  };
}
