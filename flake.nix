# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: import ./make-flake.nix inputs;

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bootvine = {
      url = "git+https://codeberg.org/wvhulle/bootvine";
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
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs = {
        hyprland = {
          follows = "hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
      };
    };
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "nixpkgs";
      };
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.57.0";
      inputs = {
        aquamarine.inputs.nixpkgs.follows = "nixpkgs";
        hyprcursor.inputs.nixpkgs.follows = "nixpkgs";
        hyprgraphics.inputs.nixpkgs.follows = "nixpkgs";
        hyprland-guiutils.inputs.nixpkgs.follows = "nixpkgs";
        hyprland-protocols.inputs.nixpkgs.follows = "nixpkgs";
        hyprlang.inputs.nixpkgs.follows = "nixpkgs";
        hyprtoolkit.inputs.nixpkgs.follows = "nixpkgs";
        hyprutils.inputs.nixpkgs.follows = "nixpkgs";
        hyprwayland-scanner.inputs.nixpkgs.follows = "nixpkgs";
        hyprwire.inputs.nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        xdph.inputs.nixpkgs.follows = "nixpkgs";
      };
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "nixpkgs";
      };
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs = {
        hyprland = {
          follows = "hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        systems.follows = "systems";
      };
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs = {
        hyprland = {
          follows = "hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
      };
    };
    import-tree = {
      url = "github:denful/import-tree";
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
    nfsm-flake = {
      url = "github:gvolpe/nfsm";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    niri-flake = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
    nnwg = {
      url = "github:Korimer/NNWG";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    self = { };
    stablepkgs = {
      url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    };
    systems = {
      url = "github:nix-systems/default";
    };
  };
}
