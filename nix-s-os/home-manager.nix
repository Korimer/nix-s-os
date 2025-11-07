{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  stateVer = "25.05";
  userDir = ./Users;
  userFiles = builtins.readDir userDir;

  homeManagerUsers = builtins.listToAttrs (
    map
      (name: {
        name = builtins.replaceStrings [".nix"] [""] name;
        value = 
          (import (userDir + "/${name}") { inherit config pkgs; })
          // {
            stateVersion = stateVer; 
            username = "${name}";
            homeDirectory = "/home/${name}";
          }
        ;
      })
      (builtins.attrNames userFiles)
  );
in {
  #imports = [ (import "${home-manager}/nixos") ];
  home-manager.users = homeManagerUsers;
}
