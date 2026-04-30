{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
  environment.systemPackages = with pkgs; [
    globalprotect-openconnect
  ];
}
