{lib,config, pkgs,...}:

let
  link-script = pkgs.writeShellScriptBin "ori-autolinker"
    (lib.strings.concatStringsSep "\n"
      (lib.mapAttrsToList
        (source: dest:
        let
          escaped_src = lib.strings.escapeShellArg (source);
          escaped_dest = lib.strings.escapeShellArg (dest);
        in
          ''
          if [ ! -e ${escaped_dest} ] || ([ -L ${escaped_dest} ] && [ -d ${escaped_dest} ]) then
            ln -sf ${escaped_src} ${escaped_dest}
          else
            ln -s ${escaped_src} ${escaped_dest}
          fi
          ''
        )
        (config.autoMkLink.targets)
      )
    )
    ;
in
{
  options.autoMkLink.targets = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
    description = "Automatically creates symlinks at the location specified by the value, pointing to the key.";
  };

  config.system.activationScripts.ori-autolinker.text = ''
    ${link-script}/bin/ori-autolinker
  '';
}
