{ inputs, den, ... }:
{
  imports = [ inputs.den.flakeModule ];

  den.hosts.x86_64-linux.magic.users.korimer = { };

  den.aspects.magic = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.hello ];
      boot.loader.grub.enable = false; 
      fileSystems."/".device = "/dev/null";
    };
  };

  den.aspects.korimer = {
    includes = [ den.provides.primary-user ];
  };
}
