{pkgs, ...}: {
  imports = [
    ./hypridle.nix
    ./waybar.nix
    ./wleave.nix
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  
  environment.systemPackages = with pkgs; [

    papirus-icon-theme
    
    # experimenting with some alternates
    #swaybg # Wallpaper Manager
    swww
    # dunst # Notification Daemon
    swaynotificationcenter

    xwayland-satellite
    libnotify # Sending notifications (recieving is built-in)
    hyprshot # Screenshots
    socat # System util for cross-app communication
    ddcutil # Brightness
    swaylock-effects # Lockscreen
    hypridle # Idle Timeout
    wleave # Log Out Button
    fuzzel # App Launcher
    kitty # Terminal
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
