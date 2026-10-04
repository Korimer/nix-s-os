{ ... }:
{
  den.aspects.korimer.provides.nvim = {
    nixos = {pkgs, ...}:
    let
      config = pkgs.neovimUtils.makeNeovimConfig {
        extraLuaPackages = p: with p; [
        ];
        extraPython3Packages = p: with p; [
          pynvim
          jupyter-client
          ipython
          nbformat
        ];
        extraPackages = p: with p; [
        ];
        withNodeJs = true;
        withRuby = true;
        withPython3 = true;
        # https://github.com/NixOS/nixpkgs/issues/211998
        customRC = "luafile ~/.config/nvim/init.lua";
      };
    in {
      nixpkgs.overlays = [
        (_: super: {
          neovim-custom = pkgs.wrapNeovimUnstable
            (super.neovim-unwrapped.overrideAttrs (oldAttrs: {
              buildInputs = oldAttrs.buildInputs ++ [ super.tree-sitter ];
            })) config;
        })
      ];

      environment.systemPackages = with pkgs; [
        neovim-custom
        python3Packages.jupytext
      ];
    };


    homeManager = {
      programs.neovim.defaultEditor = true;
    };
  };
}
