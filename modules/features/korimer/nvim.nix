{ ... }:
{
  den.aspects.korimer.provides.nvim = {
    nixos = {
      programs.neovim = {
        enable = true;
        vimAlias = true;
        viAlias = true;
      };
    };
  };
}
