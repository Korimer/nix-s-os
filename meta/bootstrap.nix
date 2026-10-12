self:
let
  hostsDir = self + "/hosts";
in
{
  listHosts = builtins.readDir hostsDir
    |> builtins.attrNames
    |> map (name: import (hostsDir+name))
  ;
}
