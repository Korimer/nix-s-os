{ pkgs }:
let
niri-taskbar =
{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, gtk3
, stdenv
}:

rustPlatform.buildRustPackage rec {
  pname = "niri-taskbar";
  version = "0.4.0+niri.25.11";

  src = fetchFromGitHub {
    owner = "LawnGnome";
    repo = "niri-taskbar";
    rev = "v${version}";
    hash = "sha256-aE5v94AA6bC0CP8pv/SPBxGKpkH+GxR/p7hTKXlvk3E=";
  };

  cargoHash = "sha256-WRc1+ZVhiIfmLHaczAPq21XudI08CgVhlIhVcf0rmSw=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    gtk3
  ];

  postInstall = ''
    install -Dm755 \
      target/${stdenv.hostPlatform.rust.rustcTarget}/release/libniri_taskbar.so \
      $out/lib/waybar/libniri_taskbar.so
  '';

  meta = {
    description = "A simple taskbar for Niri, written in Rust";
    homepage = "https://github.com/LawnGnome/niri-taskbar";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
};
in
  pkgs.callPackage niri-taskbar {}
