{ den, inputs, ... }:
{
  den.hosts.x86_64-linux.fortnite.users = {
    ets-c837275181 = {
      name = "ets-c837275181";
      userName = "ets-c837275181";
      aspect = den.aspects.korimer;
      isRemoteUser = true;
    };
  };

  den.aspects.fortnite = {
    includes = [ ];

    nixos = {
      environment.etc."mango/specializations.toml".text = ''
        [[rule.monitor_rule]]
        serial = "CNK2111CH8"
        x = 0
        y = 425
        [[rule.monitor_rule]]
        serial = "CNK8530XCM"
        x = 1920
        y = 425
        [[rule.monitor_rule]]
        serial = "CNK9331QGS"
        x = 3840
        y = 425
        [[rule.monitor_rule]]
        serial = "CNK8530XG3"
        x = 5760
        y = 0
        rr = 3
      '';
    };

    services.wpaperd = {
      enable = true;
      settings.any.path = "${inputs.self}/resources/wednesday-1.png";
    };
  };
}
