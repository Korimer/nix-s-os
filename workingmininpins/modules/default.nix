{ inputs, ... }:
{
  imports = [ inputs.flake-file.flakeModules.flakeless-parts ];

  flake-file.inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-file.url = "github:vic/flake-file";
    import-tree.url = "github:vic/import-tree";
    with-inputs.url = "github:vic/with-inputs";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    home-manager.url = "github:nix-community/home-manager";
  };
}
