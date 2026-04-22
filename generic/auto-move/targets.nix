{config, lib, ...}:
let
  userhome = "/home/${config.environment.variables.PRIMARYUSER}";
  home_files = lib.mapAttrs 
  (name: val: "${userhome}/${val}/${name}")
  {
    PersonalUtilScripts = ".";
    dunst               = ".config";
    kitty               = ".config";
    niri                = ".config";
    nvim                = ".config";
  };
  to_move = {
    zshrc = "${userhome}/.zshrc";
  };
  all_targets = home_files // to_move;
in {
  autoMkLink.targets = lib.mapAttrs' (key: val:
    lib.nameValuePair
      "${config.environment.variables.NIXROOT}static/auto-move/src/${key}"
      val
    )
    all_targets
  ;
}
