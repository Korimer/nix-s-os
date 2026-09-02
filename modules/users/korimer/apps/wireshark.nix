{
  den.aspects.korimer.provides.wireshark = { user, ... }: {
    nixos = { pkgs, ... }: {
      programs.wireshark.enable = true;
      users.users.${user.userName}.extraGroups = [ "wireshark" ];
    };
  };
}
