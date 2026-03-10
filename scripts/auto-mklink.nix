{lib,config, pkgs,...}:
{
  options.autoMkLink.targets = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
    description = "Automatically creates symlinks at the location specified by the value, pointing to the key.";
  };

  config.autoMkLink.targets = {
    "/etc/nixos/lab-system/static/auto-move/src/kitty" = "/tmp";
  };

  #config.systemd.tmpfiles.settings =
  #  lib.mapAttrs' (key: val:
  #    let
  #      basename = builtins.baseNameOf key;
  #    in 
  #      lib.nameValuePair
  #        ("link-${basename}")
  #        { "${val}/${basename}"."L+" = {
  #            argument = key;
  #            user = "${config.environment.variables.PRIMARYUSER}";
  #            #group = "${config.environment.variables.PRIMARYUSER}";
  #          };
  #      }
  #  ) (config.autoMkLink.targets);

  config.environment.systemPackages = lib.mapAttrsToList
    (source: dest:
      let
        basename = builtins.baseNameOf source;
        escaped_src = lib.strings.escapeShellArg (source);
      in
        pkgs.runCommandLocal "ori-autolink-${basename}" {} ''
          echo "lol lmao" > /tmp/impure.txt
          ln -sf "${escaped_src}" $out
          ln -sf $out "/tmp/tmp2"
        ''
          #ln -sf $out "${val}"
    )
     (config.autoMkLink.targets)
  ;

  #pkgs.runCommandLocal "commandname" {} '' command '';
  #lib.file.mkOutOfStoreSymlink = path:
  #  let
  #  pathStr = toString path;
  #name = hm.strings.storeFileName (baseNameOf pathStr);
  #in
  #  pkgs.runCommandLocal name {} ''ln -s ${escapeShellArg pathStr} $out'';
}
