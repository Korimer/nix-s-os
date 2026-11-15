{ inputs, pkgs, lib, self, ... }:
{
  imports =
     (with inputs.niri-flake.nixosModules; [ binary-cache niri ])
  ++ (with self.nixosModules; [ nfsm-wrapper ])
  ;

  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  programs.niri.package = pkgs.niri;

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  # Niri makes this true by default
  services.gnome.gnome-keyring.enable = lib.mkForce false;
}
