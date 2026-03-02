{pkgs, ...}:
let
  nixpkgs-tree-sitter = pkgs.fetchFromGitHub {
    owner = "eldritch-cookie";
    repo = "nixpkgs";
    rev = "a892e1b5b4274f181ac713b0975802bc3cca80a2";
    sha256 = "sha256-1yMy11C9/fs3/TCgv/8g8nI/BA8GIwDEr145yhLBEYY=";
  };

  alt_pkgs = import nixpkgs-tree-sitter {
    system = builtins.currentSystem;
  };
in
  {
    environment.systemPackages = [ alt_pkgs.tree-sitter ];

  }
