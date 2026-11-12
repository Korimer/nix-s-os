{ lib, stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "probespeak-az2";
  version = "1.0";

  src = ./PROBESPEAKAZ2.ttf;
  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm444 $src $out/share/fonts/truetype/PROBESPEAKAZ2.ttf
    runHook postInstall
  '';

  meta = {
    description = "usyuun font";
    license = lib.licenses.free;
    platforms = lib.platforms.all;
  };
}
