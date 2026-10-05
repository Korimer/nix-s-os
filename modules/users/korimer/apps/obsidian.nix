{ inputs, ... }:
{
  flake-file.inputs.obsidian-extensions.url = "github:karaolidis/nix-obsidian-extensions";

  den.aspects.korimer.provides.obsidian.nixos = { pkgs, ... }: {
    programs.obsidian = {
      enable = true;

      vaults.notes.target = "Documents/Obsidian";

      defaultSettings = {
        communityPlugins = with pkgs.obsidianPlugins; [
          relay
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
