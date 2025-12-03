{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  stateVer = "25.05";
  userDir = ./Users;
  userFiles = builtins.readDir userDir;

  all_unames = map
    (name: builtins.replaceStrings [".nix"] [""] name)
    (builtins.attrNames userFiles)
  ;

  homeManagerUsers = builtins.listToAttrs (
    map
      (name: {
        name = name;
        value = 
          (import (userDir + "/${name}.nix") { inherit config pkgs; })
          // {
            home.stateVersion = stateVer; 
            home.username = "${name}";
            #home.homeDirectory = "/home/${name}";
          }
        ;
      })
      (all_unames)
  );

  standardUsers = builtins.listToAttrs (
    map
      (name: {
        name = name;
        value = {};
      })
      (all_unames)
  );

  standardUserGroups = builtins.listToAttrs (
    map
      (name: {
        name = "groups.${name}";
        value = {};
      })
      (all_unames)
  );

in {
  imports = [ (import "${home-manager}/nixos") ];
  home-manager.users = homeManagerUsers;
}
