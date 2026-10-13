{
  # warcrimes
  impure-context = {
    type = "path";
    path = "./git-submodules/impure-context";
    flake = false;
  };

  #flake-parts
  flake-parts.url = "github:hercules-ci/flake-parts";
  easy-hosts.url = "github:tgirlcloud/easy-hosts";
  agenix.url = "github:ryantm/agenix";
  flake-file.url = "github:vic/flake-file";
  import-tree.url = "github:vic/import-tree";

  #config
  flatpak.url = "github:gmodena/nix-flatpak";
  home-manager.url = "github:nix-community/home-manager";
  korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  nixos-hardware.url = "github:nixos/nixos-hardware";
  #nix-auto-follow.url = "github:fzakaria/nix-auto-follow";

  #apps
  helium.url = "github:vikingnope/helium-browser-nix-flake";
  korimer-waybar.url = "github:Korimer/Waybar-Config";
  mango.url = "github:mangowm/mango";
  nix-index-database.url = "github:nix-community/nix-index-database"; # comma

  #meta
  self.submodules = true;
  nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

  #likely unused/to be replaced
  #fenix.url = "github:nix-community/fenix";
  #nnwg.url = "github:Korimer/NNWG";
  #nixflix.url = "github:Korimer/nixflix-customize-waittime";
}
