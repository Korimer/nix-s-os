{
  den.aspects.default.provides.gtk-paper-theme.nixos = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.paper-icon-theme ];
    environment.variables.GTK_ICON_THEME = "Paper";
  };
}
