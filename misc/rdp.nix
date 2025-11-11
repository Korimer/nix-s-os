{...}: {
  services.openssh.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
  services.gnome.gnome-remote-desktop.enable = true;
  services.xrdp.openFirewall = true;
  services.displayManager.autoLogin.enable = false;
  services.getty.autologinUser = null;
}
