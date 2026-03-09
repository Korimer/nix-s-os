{pkgs, ...}: {
  imports = [
    ./hypridle.nix
    ./waybar.nix
    ./swayconfig.nix
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  
  environment.systemPackages = with pkgs; [
    xwayland-satellite
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
}
