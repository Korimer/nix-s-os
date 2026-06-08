# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake {
      inherit inputs;
      specialArgs = 
        let root = (import ./flake-root.nix); in
        {
          flake-root = {
            path = root;
            literal = builtins.unsafeDiscardStringContext (builtins.toString root);
          };
        };
    } (inputs.import-tree ./modules);

  inputs = {
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
