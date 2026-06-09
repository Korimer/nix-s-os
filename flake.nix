# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: import ./make-flake.nix inputs;
  inputs = {
    calibre-bookfusion = {
      url = "github:BookFusion/calibre-plugin";
      flake = false;
    };
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
    korimer-mini-server.url = "github:Korimer/MinimalNixServer";
    nix-auto-follow = {
      url = "github:fzakaria/nix-auto-follow";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia-shell.url = "github:noctalia-dev/noctalia-shell";
    self.submodules = true;
  };
}
