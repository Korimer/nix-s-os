{ examplename, den, inputs, lib, ... }:
{

  flake-file.inputs = {
    den.url = "github:vic/den";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-aspects.url = "github:vic/flake-aspects";
    import-tree.url = "github:vic/import-tree";
    with-inputs.url = "github:vic/with-inputs";
    with-inputs.flake = false;
  };

  flake-file = {  
# Replicate dendritic's default outputs  
    outputs = "inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)";  

# Add required inputs  
  };

# we can import this flakeModule even if we dont have flake-parts as input!
  imports = [
    (inputs.den.namespace "examplename" true)
      inputs.den.flakeModule
      inputs.flake-file.flakeModules.dendritic
  ];
  den.ctx.user.includes = [ den.provides.define-user ];

  examplename.beastmode = {
  };

  den.aspects.netzach = {
    includes = [ examplename.beastmode ];
  };

  den.default.nixos = {
# remove for real host
    fileSystems."/".device = lib.mkDefault "/dev/fake";
#fileSystems."/".fsType = "auto";
    boot.loader.grub.enable = lib.mkDefault false;
  };

# include den batteries or your own re-usable aspects
# this affects all users, could also be done per user
}
