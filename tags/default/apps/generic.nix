{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs.nh.enable = true;
  programs.wireshark.enable = true;
  environment.systemPackages = with pkgs; [
    # cool dev stuff
    live-server
    grub2
    parted

    # shells/langs
    powershell
    python3

    # system utils
    unzip
    p7zip
    wget
    ripgrep

    # blue collar maxxing
    slack
    teams-for-linux
  ];
}
