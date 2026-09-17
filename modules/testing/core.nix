{ inputs, ... }:
{
  den.default.nixos = { pkgs, lib, ... }:
  let
    mangoSessionName = "mango-default";

    mangoDesktopEntry = lib.generators.toINI {} {
      "Desktop Entry" = {
        Name = "Mango";
        Exec = "${pkgs.mango}/bin/mango -c ${./config.conf}";
        Type = "Application";
      };
    };

    mangoSession = pkgs.runCommand "mango-default" {
      passthru.providedSessions = [ mangoSessionName ];
    } ''
      mkdir -p $out/share/wayland-sessions
      cat > $out/share/wayland-sessions/${mangoSessionName}.desktop <<EOF
      ${mangoDesktopEntry}
      EOF
    '';
  in
  {
    imports = [
      inputs.mango.nixosModules.mango
    ];

    programs.mango.enable = true;

    services.displayManager.sessionPackages = [ mangoSession ];
    services.displayManager.defaultSession = mangoSessionName;

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
