{ flake-file, ... }:
{
  flake-file.inputs.nixflix.url = "github:kiriwalawren/nixflix";

  den.aspects.asya.provides.jellyfin.nixos = { pkgs, ... }:
  {
    imports = [ flake-file.inputs.nixflix.nixosModules.default ];

    nixflix = {
      enable = true;
      nginx.enable = true;

      jellyfin = {
        enable = true;
        users = {
          
        };
      };
    };
  };
}
