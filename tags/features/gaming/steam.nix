{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
    gamemode.enable = true;
    gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };
  };
  environment.systemPackages = [ pkgs.steam-run ];
}
