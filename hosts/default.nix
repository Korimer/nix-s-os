let
  getHostSpec = name: {
    name = name; 
    value = import ./${name}/_spec.nix;
  };
  hosts = builtins.readDir ./.
    |> builtins.attrNames
    |> builtins.filter (f: f!="default.nix")
    |> map getHostSpec
    |> builtins.listToAttrs
  ;
in
  hosts
