{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # Would be nice to have this, but it's broken as of https://github.com/hyprwm/Hyprland/issues/9750
    xwayland.enable = false; 
  };
  # Oh well...
  services.xserver.enable = true;
  
  environment.systemPackages = with pkgs; [
    hyprshot # Screenshots
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
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
