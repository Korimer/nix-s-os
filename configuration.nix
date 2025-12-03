# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

let
  agenixTar = builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./system-specific/hardware-configuration.nix
      # Include organized os config
      ./ll_config/audio-video.nix
      ./ll_config/locale.nix
      ./ll_config/users.nix
      ./ll_config/networking.nix
      ./ll_config/boot.nix

      # Include support for encrypted secrets
      "${agenixTar}/modules/age.nix"
      ./system-specific/age-config.nix

      # Include my personal customizations
      ./desktop.nix
      ./preferences/nix-prefs.nix
      
      # Include the stuff I actually want to install
      ./programs.nix

      # Include the extras
      ./misc/rdp.nix
    ]
      ++ lib.optional (builtins.pathExists ./system-specific/domain.nix) ./system-specific/domain.nix 
      ++ lib.optional (builtins.pathExists ./system-specific/display.nix) ./system-specific/display.nix 
    ;

  _module.args.agenixTar = agenixTar;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  users.users.Administrator.isSystemUser = true;
  users.users.Administrator.group = "Administrator";
  users.groups.Administrator = {};

  users.users.ets-c837275181.isSystemUser = true;
  users.users.ets-c837275181.group = "ets-c837275181";
  users.groups.ets-c837275181 = {};


  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
