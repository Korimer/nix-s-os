{ inputs, ... }:
{
  den.default.nixos = { pkgs, lib, ... }:
  let
    mangoPackage = inputs.mango.packages.${pkgs.system}.mango;

    mangoConfig = pkgs.writeText "mango-default-config.conf" (builtins.readFile ./config.conf);

    mangoWrapper = pkgs.writeShellScript "mango-with-config" ''
      exec ${mangoPackage}/bin/mango -c "${mangoConfig}"
    '';

    mangoWithConfig = mangoPackage.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        rm -f $out/bin/mango
        ln -s ${mangoWrapper} $out/bin/mango
      '';
    });
  in
  {
    imports = [
      inputs.mango.nixosModules.mango
    ];

    programs.mango.enable = true;
    programs.mango.package = mangoWithConfig;

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
