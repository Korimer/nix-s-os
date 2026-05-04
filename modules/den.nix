{ den, inputs, lib, ... }:
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

  imports = [
    inputs.den.flakeModule
    inputs.flake-file.flakeModules.flakeless-parts
  ];

  #flake-file.outputs = "flake-parts";

  den.ctx.user.includes = [ den.provides.define-user ];

  den.default = {
    includes = [
      den.provides.define-user
      #  den.provides.hostname
        den.provides.inputs'
        den.provides.self'
    ];

    nixos = {
# remove for real host
      fileSystems."/".device = lib.mkDefault "/dev/fake";
#fileSystems."/".fsType = "auto";
      boot.loader.grub.enable = lib.mkDefault false;
    };

  };
  # include den batteries or your own re-usable aspects
  # this affects all users, could also be done per user
}
