{ inputs, flake-root, ... }:
{
  flake-file.inputs.muffon-OLD-REPLACE-WHEN-MERGED.url = "github:r-ryantm/nixpkgs/auto-update/muffon";
  den.aspects.korimer.provides.muffon = {
    #homeManager = { config, ... }:
    #let configPath = "${flake-root.literal}/modules/features/korimer/mediaplayers/config.json"; in
    #{
    #  xdg.configFile."muffon/config.json".source = config.lib.file.mkOutOfStoreSymlink configPath;
    #};
    nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.muffon-OLD-REPLACE-WHEN-MERGED.legacyPackages.${pkgs.stdenv.hostPlatform.system}.muffon
      ];
    };
  };
}
