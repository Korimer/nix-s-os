{...}:
{
  programs.waybar = {
    enable = true;
  };

  environment.etc."xdg/waybar/config.jsonc".text = ''

  '';
};
