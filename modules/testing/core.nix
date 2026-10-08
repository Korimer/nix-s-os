{ inputs, ... }:
{
  den.default.nixos = { pkgs, lib, ... }:
  {
    imports = [
      inputs.mango.nixosModules.mango
    ];

    xdg.portal = {
      enable = true;
      wlr.enable = false;
      extraPortals = [ pkgs.xdg-desktop-portal-luminous ];
      
      config.mango = {
        "org.freedesktop.impl.portal.Screencast" = lib.mkForce "luminous";
        "org.freedesktop.impl.portal.Screenshot" = lib.mkForce "luminous";
      };
    };

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    programs.mango.enable = true;

    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      papirus-icon-theme

      # experimenting with some alternates
      #swaybg # Wallpaper Manager
      awww
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
      wl-clipboard # Clipboard Manager
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
  };
}
