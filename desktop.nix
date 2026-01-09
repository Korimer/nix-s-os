{pkgs, ...}: let
  #flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  #hyprland = (import flake-compat {
  #  src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/main.tar.gz";
  #}).defaultNix;
in {
  programs.hyprland = {
    enable = true;
    # set the flake package
  #  package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
  #  portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  
  #nix.settings = {
  #  substituters = ["https://hyprland.cachix.org"];
  #  trusted-substituters = ["https://hyprland.cachix.org"];
  #  trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  #};

  ## Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.displayManager.gdm.wayland = true;
  #programs.hyprland = {
  #  enable = true  #  withUWSM = true;
  #  xwayland.enable = true;
  #};
  environment.systemPackages = with pkgs; [
    socat # System util for cross-app communication
    ddcutil # Brightness
    swaylock-effects # Lockscreen
    hypridle # Idle Timeout
    wlogout # Log Out Button
    fuzzel # App Launcher
    kitty # Terminal
    dunst # Notification Daemon
    swaybg # Wallpaper Manager
    nemo # File explorer
    hyprpanel # Status bar
    copyq # Clipboard Manager
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = [pkgs.nerd-fonts.droid-sans-mono];
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "DroidSansMono" ];
        sansSerif = [ "DroidSansMono" ];
        monospace = [ "DroidSansMono" ];
      };
    };
  };
  #services.xserver.videoDrivers = ["nvidia"];
  #hardware.graphics.enable = true;
  #hardware.nvidia = {
  #  open = false;
  #  modesetting = {
  #    enable = true;
  #  };
  #};

  #programs.hyprlock.enable = true;
  #services.hypridle.enable = true;
  
  # Enable the GNOME Desktop Environment.
  #services.displayManager.gdm.enable = true;
  #services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
