# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: import ./make-flake.nix inputs;

  inputs = {
    agenix.url = "github:ryantm/agenix";
    den.url = "github:vic/den";
    fenix.url = "github:nix-community/fenix";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flatpak = {
      type = "github";
      owner = "gmodena";
      repo = "nix-flatpak";
      ref = "latest";
    };
    helium.url = "github:vikingnope/helium-browser-nix-flake";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:vic/import-tree";
    impure-context = {
      type = "path";
      path = "./git-submodules/impure-context";
      flake = false;
    };
    korimer-mini-server.url = "github:Korimer/MinimalNixServer";
    muffon-OLD-REPLACE-WHEN-MERGED.url = "github:r-ryantm/nixpkgs/auto-update/muffon";
    nix-auto-follow = {
      url = "github:fzakaria/nix-auto-follow";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixflix.url = "github:Korimer/nixflix-customize-waittime";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    nnwg.url = "github:Korimer/NNWG";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia-shell.url = "github:noctalia-dev/noctalia-shell";
    self.submodules = true;
  };
}
