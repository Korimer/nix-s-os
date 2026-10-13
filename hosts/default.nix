let
  removeFileExtension =
    builtins.replaceStrings 
      [".nix"]
      [""]
  ;
  getHostSpec = name:
    let
      spec = import ./${name}.nix;
      tags = [name] ++ (spec.tags or []);
    in
    {
      name = name; 
      value = spec // { tags = tags; };
    }
  ;
  hosts = builtins.readDir ./.
    |> builtins.attrNames
    |> builtins.filter (f: f!="default.nix")
    |> map removeFileExtension
    |> map getHostSpec
    |> builtins.listToAttrs
  ;
in
  hosts
