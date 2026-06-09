{ examplename, den, inputs, lib, ... }:
{
# we can import this flakeModule even if we dont have flake-parts as input!
  imports = [
    (inputs.den.namespace "examplename" true)
    inputs.den.flakeModule
  ];
  den.schema.user.includes = [ den.provides.define-user ];

  examplename.beastmode = {
  };

  den.aspects.netzach = {
    includes = [ examplename.beastmode ];
  };

  den.default.includes = [ den.batteries.self' den.batteries.inputs' ];

  den.default.nixos = {
# remove for real host
    fileSystems."/".device = lib.mkDefault "/dev/fake";
#fileSystems."/".fsType = "auto";
    boot.loader.grub.enable = lib.mkDefault false;
  };

# include den batteries or your own re-usable aspects
# this affects all users, could also be done per user
}
