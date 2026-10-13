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

  importFrom = root: subdirs: subdirs
    |> map (dir: {
         name = dir;
         value = inputs.import-tree ./${root}/${dir};
         })
    |> builtins.listToAttrs
  ;

  resolveHostSpec = host:
    let
      spec = import ./hosts/${host}.nix;
      tags = [ "default" host ] ++ (spec.tags or []);
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

  tagList = simpleReadDir "tags";
  tagSpecs = tagList |> importFrom "tags";
in
{
  hosts = hostSpecs;
  presets = presetSpecs;
  tags = tagSpecs;
}
