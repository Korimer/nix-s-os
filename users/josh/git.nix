{ ... }:
{
  nix = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.git ];
  };
  home = { ... }: {
    programs.git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
