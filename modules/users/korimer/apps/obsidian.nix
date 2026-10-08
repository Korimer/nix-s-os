{ inputs, ... }:
{
  flake-file.inputs.obsidian-extensions.url = "github:karaolidis/nix-obsidian-extensions";
  
  den.aspects.korimer.provides.obsidian.nixos = { pkgs, ... }: {
    nixpkgs.overlays = [
      inputs.obsidian-extensions.overlays.default
    ];
  };

  den.aspects.korimer.provides.obsidian.homeManager = { pkgs, ... }: {
    programs.obsidian = {

      enable = true;

      vaults.notes.target = "Documents/Obsidian";

      defaultSettings = {
        communityPlugins = with pkgs.obsidianPlugins; [
          system3-relay
          dataview
          obsidian-git
          obsidian-importer
          vim-yank-highlight
        ];

        themes = with pkgs.obsidianThemes; [
          catppuccin
        ];
      };
    };
  };
}
