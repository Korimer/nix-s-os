{ ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer.classes = [];
  };

  den.aspects.magic = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.vim
        ];
      };
  };
}
