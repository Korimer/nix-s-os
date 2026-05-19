{ inputs, ... }:
{
  den.aspects.korimer.provides.cargo = {
    nixos = { pkgs, ... }: {
      nixpkgs.overlays = [ inputs.fenix.overlays.default ];
      environment.systemPackages = [
        (pkgs.fenix.complete.withComponents [
         "cargo"
         "clippy"
         "rust-src"
         "rustc"
         "rustfmt"
        ])
          pkgs.rust-analyzer-nightly
      ];
    };
  };
}

