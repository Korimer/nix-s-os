inputs@{...}:
let
  simpleReadDir = directory:
  builtins.readDir ./${directory}
    |> builtins.attrNames
  ;

  removeFileExtension =
    builtins.replaceStrings 
      [".nix"]
      [""]
  ;

  importFrom = root: subdirs:
    subdirs
      |> map (dir: {
           name = dir;
           value = inputs.import-tree ./${root}/${dir};
           })
      |> builtins.listToAttrs
  ;

  resolveHostSpec = host:
    let
      spec = import ./hosts/${host}.nix;
      tags = [ "default" "hosts/${host}" ] ++ (spec.tags or []);
    in
    {
      name = host; 
      value = spec // { tags = tags; };
    }
  ;
  hostList = simpleReadDir "hosts" |> map removeFileExtension;
  hostSpecs = hostList |> map resolveHostSpec |> builtins.listToAttrs;

  presetList = simpleReadDir "presets";
  presetSpecs = presetList |> importFrom "presets";

  perTag = tag:
    let tagFiles = inputs.import-tree ./tags/${tag}; in
    { modules = [ tagFiles ]; }
  ;
in
{
  hosts = hostSpecs;
  presets = presetSpecs;
  perTag = perTag;
}
