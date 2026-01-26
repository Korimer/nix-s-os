{ lib, config, ... }:

  let envar = {
    PRIMARYUSER = "korimer";
    NIXROOT = "/etc/nixos";
  };

in {
  environment.variables = lib.mapAttrs (
      key: val:
      lib.mkDefault val
    )
    (envar)
  ;
  
  # also known as who needs home-manager lmfaoooooooooooooooooooooooooooooooooooooooooooooooooooo
  system.activationScripts.autoMove.text = ''
    cd ${config.environment.variables.NIXROOT}

    PRIMARYUSER="${config.environment.variables.PRIMARYUSER}"

    while read -r D; do
      while IFS="=" read -r src dest; do
        truesrc="$D/src/$src"
        truedest=$(eval echo "$dest")
        ln -sf "$truesrc" "$truedest"
      done < "$D/target.config"
    done < <(
      find -L "$(readlink -f ./auto-move)" -mindepth 1 -maxdepth 1 -type d 
    )
  '';
}
