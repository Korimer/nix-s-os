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

  system.activationScripts.autoMove.text = ''
    cd ${config.environment.variables.NIXROOT}

    PRIMARYUSER="${config.environment.variables.PRIMARYUSER}"

    IFS="="
    while read -r src dest
    do
      echo "source is $src"
      truesrc="./auto-move/src/$src"
      truedest=$(eval echo "$dest" )
      echo "dest is $truedest"
      cp -r $truesrc $truedest
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
