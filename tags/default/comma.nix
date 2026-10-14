{ inputs, ... }:
{
  #flake-file.inputs.nix-index-database.url = "github:nix-community/nix-index-database";

  imports = [ inputs.nix-index-database.nixosModules.default ];
  programs.nix-index-database.comma.enable = true;
}
