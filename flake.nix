# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: import ./make-flake.nix inputs;

  inputs = {
    agenix.url = "github:ryantm/agenix";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    flake-file.url = "github:denful/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-root.url = "github:srid/flake-root";
    flatpak.url = "github:gmodena/nix-flatpak";
    helium.url = "github:vikingnope/helium-browser-nix-flake";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:denful/import-tree";
    impure-context = {
      type = "path";
      path = "./git-submodules/impure-context";
      flake = false;
    };
    korimer-mini-server.url = "github:Korimer/MinimalNixServer";
    korimer-waybar.url = "github:Korimer/Waybar-Config";
    mango.url = "github:mangowm/mango";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    self.submodules = true;
    systems.url = "github:nix-systems/default";
  };
}
