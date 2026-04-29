{ ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer.classes = [];
  };

  den.aspects.magic = {
    nixos =
      { pkgs, ... }:
      {
        systemd.sleep.extraConfig = "HibernateMode=shutdown";
        environment.systemPackages = [
          pkgs.vim
        ];
      };
  };
}
