{
  environment.etc."mango/specializations.toml".text = ''
    [[rule.monitor_rule]]
    serial = "UWZ190700593"
    x = 0
    y = 0
    rr = 1
    [[rule.monitor_rule]]
    serial = "209MXUNBQ390"
    x = 1080
    y = 355
    ''
  ;
  environment.etc."niri/monitors.kdl".text = ''
    output "ViewSonic Corporation VA2459 Series UWZ190700593" {
      mode "1920x1080@60.000"
      transform "90"
      position x=0 y=0
    }

    output "LG Electronics LG ULTRAGEAR 209MXUNBQ390" {
      mode "2560x1440@119.998"
      position x=1080 y=356
    }
  '';
}
