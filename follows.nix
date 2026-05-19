inputs: {

  nixpkgs-lib.follows = "nixpkgs";
  helium-browser-nix-flake.inputs.utils.follows = "flake-utils";

  flake-utils.lib =
    let
      inherit (inputs.nixpkgs) lib;
      defaultSystems = lib.systems.flakeExposed;
      transpose = inputs.flake-aspects { inherit lib; };
      eachSystem = systems: cb: transpose (lib.genAttrs systems cb);
      eachDefaultSystem = eachSystem defaultSystems;
    in
    {
      inherit defaultSystems eachSystem eachDefaultSystem;
    };

}
