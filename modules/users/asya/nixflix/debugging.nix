{
 
  den.aspects.asya.provides.nixflix.provides.jellyfin-debugging.nixos = { pkgs, lib, ... }:
  {
  };

  den.aspects.asya.provides.nixflix.provides.manual-ordering.nixos = { pkgs, lib, ... }:
  let
    Req = _: service: { requiredBy = [ "${service}.service" ]; };
  in
  {
    #systemd.services = builtins.mapAttrs Req {
    #  "jellyfin-api-key" = "jellyfin";
    #  "sonarr-config" = "sonarr";
    #};
  };
}
