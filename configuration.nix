# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include organized os config
      ./ll_config/audio-video.nix
      ./ll_config/locale.nix
      ./ll_config/users.nix
      ./ll_config/networking.nix
      ./ll_config/boot.nix

      # Include my personal customizations
      ./desktop.nix
      
      # Include the stuff I actually want to install
      ./programs.nix
    ]
      ++ lib.optional (builtins.pathExists ./system-specific/domain.nix) ./system-specific/domain.nix 
      ++ lib.optional (builtins.pathExists ./system-specific/display.nix) ./system-specific/display.nix 
    ;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
