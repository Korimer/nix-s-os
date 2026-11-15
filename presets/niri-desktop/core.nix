{ inputs, pkgs, lib, self, ... }:
{
  imports =
     (with inputs.niri-flake.nixosModules; [ binary-cache niri ])
  ++ (with self.nixosModules; [ nfsm-wrapper ])
  ;

  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  programs.niri.package = pkgs.niri;

  programs.niri.enable = true;
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  environment.etc."niri/config.kdl".source = ./base-config.kdl;
  environment.variables.NIRI_CONFIG = "/etc/niri/config.kdl";

  # Niri makes this true by default
  services.gnome.gnome-keyring.enable = lib.mkForce false;
}
