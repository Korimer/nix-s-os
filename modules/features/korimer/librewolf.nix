{ den, ... }:
{
  den.aspects.korimer.provides.librewolf = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.librewolf ];};

    includes = [ den.aspects.korimer.provides.librewolf.provides.firejail-csu-vpn ];

    provides.firejail-csu-vpn = {
      includes = [
        den.aspects.firejail
        den.aspects.korimer.provides.wireguard
      ];

      # Can also try nsenter...
      nixos = { pkgs, lib, ... }:
      let
        jailedAppBin = "librewolf-firejail";
        jailedAppName = "Librewolf (CSU VPN)";

        desktopEntry = "$out/share/applications/${jailedAppBin}.desktop";

        librewolfFirejailDesktop = pkgs.runCommand "${jailedAppBin}-desktop" {} ''
          mkdir -p $out/share/applications

          cp ${pkgs.librewolf}/share/applications/librewolf.desktop \
            ${desktopEntry}

          substituteInPlace ${desktopEntry} \
            --replace-fail 'Name=LibreWolf' 'Name=${jailedAppName}' \
            --replace-fail 'Exec=librewolf' 'Exec=${jailedAppBin}'
        '';
      in {
        environment.systemPackages = [
          librewolfFirejailDesktop
        ];

        programs.firejail = {
          enable = true;

          wrappedBinaries.librewolf-firejail = {
            executable = "${lib.getBin pkgs.librewolf}/bin/librewolf";
            profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
          };
        };
      };
    };
  };
}
