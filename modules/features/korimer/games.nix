{ inputs, ... }:
{
  den.aspects.korimer.provides.games = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        everest
          (olympus.override {celesteWrapper = "steam-run";})
      ];

      services.flatpak.enable = true;
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

