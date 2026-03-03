
# print-hostkeys.nix
with import <nixpkgs/nixos> { system = builtins.currentSystem; };

let
  cfg = import /etc/nixos/configuration.nix { inherit system; };
in
  builtins.trace
    (builtins.concatStringsSep "\n"
      (map (key: "${key}: ${cfg.services.openssh.hostKeys.${key}}") 
           (builtins.attrNames cfg.services.openssh.hostKeys)))
    cfg.services.openssh.hostKeys
