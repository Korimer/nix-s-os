self:
let
  filterAttrs = pred: set: removeAttrs set
    (builtins.filter
      (name: !pred name set.${name})
      (builtins.attrNames set)
    );
in
{
  listHosts = builtins.readDir "${self}"
    |> filterAttrs (_: v: v == "regular")
    |> map (i: builtins.replaceStrings i [".nix"] [""])
  ;
}
