{ config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.thunderbird.enable = true;

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };

  environment.systemPackages = with pkgs; [
    ghostty
    remmina
    slack
    neovide
    xclip
    git
  ];
}
