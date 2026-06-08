{ den, inputs, ... }:
{
  flake-file.inputs.noctalia-shell.url = "github:noctalia-dev/noctalia-shell";

  den.aspects.korimer.provides.noctalia-shell = {
    includes = [
      den.aspects.niriconfig
      # System settings
      den.aspects.power
      den.aspects.networking
    ];

    nixos =
    {
      niriconfig.niristartup.text = ''
        spawn-at-startup "noctalia-shell"
      '';
    };

    homeManager = {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia-shell.enable = true;
    };
  };

}
