{ inputs, ... }:
{
  flake-file.inputs.flake-root = {
    type = "github";
    owner = "srid";
    repo = "flake-root";
    rev = "b759a56851e10cb13f6b8e5698af7b59c44be26e";
  };

    imports = [ inputs.flake-root.flakeModule ];
}
