{
  den.aspects.korimer.provides.ssh-agent.nixos = { lib, pkgs, ...}: {
    #services.gnome.gcr-ssh-agent.enable = false;
    #services.gnome.gnome-keyring.enable = false;
    #programs.ssh.startAgent = true;
    #services.gnome.gnome-keyring.enable = lib.mkForce true;
    #programs.seahorse.enable = lib.mkForce true;

    #environment.systemPackages = [ pkgs.openssh-askpass ];
    #programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.openssh-askpass}/libexec/ssh-askpass";
  };
}
