{ pkgs }:
let
niri-taskbar = 
  { lib
  , rustPlatform
  , fetchFromGitHub
  , pkg-config
  , gtk3
  }:

  rustPlatform.buildRustPackage rec {
    pname = "niri-taskbar";
    version = "0.4.0+niri.25.11";

    src = fetchFromGitHub {
      owner = "LawnGnome";
      repo = "niri-taskbar";
      rev = "v${version}";
      hash = lib.fakeHash;
    };

    cargoHash = lib.fakeHash;

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      gtk3
    ];

    postInstall = ''
      install -Dm755 \
      target/release/libniri_taskbar.so \
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
