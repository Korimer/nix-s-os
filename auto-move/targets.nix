{config, lib, ...}:
let
  userhome = "/home/${config.environment.variables.PRIMARYUSER}/";
  to_move = {
    PersonalUtilScripts = "${userhome}PersonalUtilScripts";
    #dunst               = "";
    #kitty               = "";
    #niri                = "";
    #nvim                = "";
  };
in {
  autoMkLink.targets = lib.mapAttrs' (key: val:
    lib.nameValuePair
      ("${config.environment.variables.NIXROOT}static/auto-move/src/${key}")
      (val)
    )
    (to_move)
  ;
}
