{
  nixpkgs.hostPlatform = "aarch64-linux";
  system.stateVersion = "26.11";
  security.sudo.wheelNeedsPassword = false;
}
