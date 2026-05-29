{ inputs, ... }:
{
  flake-file.inputs.korimerNvimRepo = {
    url = "github:Korimer/vimcfg";
    flake = false;
  };

  den.aspects.korimer.provides.nvim = {
    homeManager = { ... }:
    {
      programs.neovide.enable = true;
      programs.neovim.enable = true;
      home.file.".config/nvim".source = inputs.korimerNvimRepo;
    };
  };
}
