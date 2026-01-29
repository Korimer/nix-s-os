{pkgs, ...}: {
  imports = [
    ./hypridle.nix
    ./waybar.nix
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  #programs.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #  # Can set this to true when I'm willing to lock in and get it sorted
  #  # But without a few hours of setup all its gonna do is brick apps that expect $DISPLAY to exist
  #  withUWSM = false; #
  #};
  
  environment.systemPackages = with pkgs; [
    libnotify # Sending notifications (recieving is built-in)
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



  #hardware.graphics.enable = true;
  #hardware.nvidia = {
  #  open = false;
  #  modesetting = {
  #    enable = true;
  #  };
  #};
}
