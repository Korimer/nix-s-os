{ flake-file.inputs = {

  bootvine.url = "git+https://codeberg.org/wvhulle/bootvine";

  #flake-parts
  flake-parts.url = "github:hercules-ci/flake-parts";
  flake-root.url = "github:srid/flake-root";
  easy-hosts.url = "github:tgirlcloud/easy-hosts";
  agenix.url = "github:ryantm/agenix";
  flake-file.url = "github:denful/flake-file";
  import-tree.url = "github:denful/import-tree";

  #config
  flatpak.url = "github:gmodena/nix-flatpak";
  home-manager.url = "github:nix-community/home-manager";
  korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  nixos-hardware.url = "github:nixos/nixos-hardware";
  #nix-auto-follow.url = "github:fzakaria/nix-auto-follow";

  #apps
  helium.url = "github:vikingnope/helium-browser-nix-flake";
  korimer-waybar.url = "github:Korimer/Waybar-Config";
  nix-index-database.url = "github:nix-community/nix-index-database"; # comma
  #desktops
  mango.url = "github:mangowm/mango";
  hyprland = {
    url = "github:hyprwm/Hyprland/v0.57.0";
    inputs.nixpkgs.autoFollow = false;
  };
  hyprgrass.url = "github:horriblename/hyprgrass";
  hyprsplit.url = "github:shezdy/hyprsplit";
  hyprspace.url = "github:KZDKM/Hyprspace";
  hypr-dynamic-cursors.url = "github:VirtCode/hypr-dynamic-cursors";
  # Hyprfocus, Hyprbars, Borders-plus-plus
  hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

  #meta
  self.submodules = true;
  systems.url = "github:nix-systems/default";
  nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  stablepkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";

  #likely unused/to be replaced
  #fenix.url = "github:nix-community/fenix";
  nnwg.url = "github:Korimer/NNWG";
  #nixflix.url = "github:Korimer/nixflix-customize-waittime";
};}
