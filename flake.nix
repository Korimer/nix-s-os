# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: import ./make-flake.nix inputs;

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    easy-hosts = {
      url = "github:tgirlcloud/easy-hosts";
    };
    flake-file = {
      url = "github:denful/flake-file";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    flake-root = {
      url = "github:srid/flake-root";
    };
    flatpak = {
      url = "github:gmodena/nix-flatpak";
    };
    helium = {
      url = "github:vikingnope/helium-browser-nix-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.inputs.systems.follows = "systems";
      };
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:denful/import-tree";
    };
    impure-context = {
      type = "path";
      path = "./git-submodules/impure-context";
      flake = false;
    };
    korimer-mini-server = {
      url = "github:Korimer/MinimalNixServer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    korimer-waybar = {
      url = "github:Korimer/Waybar-Config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:mangowm/mango";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        scenefx.inputs.systems.follows = "systems";
      };
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    };
    self = {
      submodules = true;
    };
    systems = {
      url = "github:nix-systems/default";
    };
  };
}
