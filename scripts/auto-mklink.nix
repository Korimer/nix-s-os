{lib,config,...}:
{
  options.autoMkLink.targets = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
    description = "Automatically creates symlinks at the location specified by the value, pointing to the key.";
  };

  config.autoMkLink.targets = {
    "/etc/nixos/lab-system/static/auto-move/src/kitty/" = "/tmp";
  };

  config.systemd.tmpfiles.settings =
    lib.mapAttrs' (key: val:
      let
        basename = builtins.baseNameOf key;
      in 
        lib.nameValuePair
          ("link-${basename}")
          { "${val}/${basename}"."L+".argument = key; }
    ) (config.autoMkLink.targets);

  #pkgs.runCommandLocal "commandname" {} '' command '';
}
