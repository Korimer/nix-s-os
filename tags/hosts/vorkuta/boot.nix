{ lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    generic-extlinux-compatible.enable = true;
  };
}
