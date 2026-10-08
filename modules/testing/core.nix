{ inputs, ... }:
{
  den.default.nixos = { pkgs, lib, ... }:
  {
    imports = [
      inputs.mango.nixosModules.mango
    ];

    xdg.portal = {
      enable = true;
      wlr = {
        enable = true;
        settings = {
          screencast = {
            chooser_type = "simple";
            chooser_cmd = "${pkgs.wlr-utils}/bin/wlr-chooser";
          };
        };
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

      

      xwayland-satellite
      libnotify # Sending notifications (recieving is built-in)
      flameshot # Screenshots
      socat # System util for cross-app communication
      ddcutil # Brightness
      swaylock-effects # Lockscreen
      hypridle # Idle Timeout
      wleave # Log Out Button
      rofi # App Launcher
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
