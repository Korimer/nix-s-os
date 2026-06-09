{ inputs, ... }:
{
  flake-file.inputs.calibre-bookfusion = {
    url = "github:BookFusion/calibre-plugin";
    flake = false;
  };

  den.aspects.korimer.provides.calibre.homeManager = {
    programs.calibre = {
      enable = true;
      plugins = [ inputs.calibre-bookfusion ];
    };
  };
}
