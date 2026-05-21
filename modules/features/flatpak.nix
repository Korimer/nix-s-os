{ inputs, ... }:
{
  flake-file.inputs.flatpak = {
    type = "github";
    owner = "gmodena";
    repo = "nix-flatpak";
    ref = "latest"; # main is unstable...
  };

  den.aspects.flatpak = {
    nixos = { ... }: {
      services.flatpak.enable = true;
      imports = [
        inputs.flatpak.nixosModules.nix-flatpak
      ];
    };
  };

}
