{ den, ... }:
{
  den.aspects.korimer.provides.games = {

    includes = [ den.aspects.flatpak ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        everest
          (olympus.override {celesteWrapper = "steam-run";})
      ];

      services.flatpak.packages = [
        "org.vinegarhq.Sober"
      ];

      systemd.services.flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script =
          ''
          flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
          '';
      }; 
    };
  };
}

