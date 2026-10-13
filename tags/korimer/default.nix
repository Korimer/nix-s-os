{ inputs, ... }:
let
  mango = (inputs.self + /presets/mango-desktop);
in
{
  imports = [ (inputs.import-tree mango) ];
}
