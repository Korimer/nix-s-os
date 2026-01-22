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

    IFS="="
    while read -r src dest
    do
      truesrc="./auto-move/src/$src"
      truedest=$(eval echo "$dest")
      ln -sf $(realpath $truesrc) $truedest
    done < ./auto-move/target.config
    
    #$targets = Get-Content "./auto-move/target.json" | ConvertFrom-Json

    #$targets.psobject.properties | 
    #  % {
    #    $src = "./auto-move/src/$($_.Name)"
    #    $dest = $ExecutionContext.InvokeCommand.ExpandString($_.Value)
    #    Copy-Item -Path $_.Name -Destination $dest -Recurse
    #  }
  '';
}
