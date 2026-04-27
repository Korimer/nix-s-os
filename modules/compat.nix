{ den, inputs, ... }:
{
  den.aspects.magic = {
    nixos =
    { pkgs, ... }:
    {
      imports = [ ./_nondendric/system-specific/home-laptop/core.nix ];
    };
  };
}
