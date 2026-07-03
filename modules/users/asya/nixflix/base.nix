{ inputs, den, ... }:
{
  flake-file.inputs.nixflix.url = "github:kiriwalawren/nixflix";

  den.aspects.asya.provides.nixflix = {
    includes = builtins.attrValues den.aspects.asya.provides.nixflix.provides;
    nixos =
    {
      imports = [ inputs.nixflix.nixosModules.default ];

      nixflix = {
        enable = true;
        mediaDir = "/jellyfin/media";
        stateDir = "/jellyfin/.state";
        
        theme.enable = true;
        theme.name = "blackberry-carol";

        nginx = {
          enable = true;
          addHostsEntries = true;
        };

        postgres.enable = true;
      };
    };
  };
}
