{
  den.aspects.korimer.provides.keepassxc = {
    nixos = {
      programs.ssh.startAgent = true;
    };

    homeManager = {
      programs.keepassxc = {
        autostart = true;
        enable = true;
        settings = {
          # For available settings, see https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
          FdoSecrets.Enabled = true; # Enable Secret Service Integration
          SSHAgent.Enabled = true;
        };
      };

      xdg.autostart.enable = true; # Enable creation of XDG autostart entries.
    };
  };
}
