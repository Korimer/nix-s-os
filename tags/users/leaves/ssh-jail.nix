# The setup: files in /leavesfiles/files live in tmp, so they're eventually garbage collected
# However they can be discovered from /leavesfiles
# ChrootDirectory disallows any path not owned by root, so this gets around it
{
  systemd.tmpfiles.rules = [
    "d /leavesfiles       0755 root   root   -"
    "d /leavesfiles/files 0555 root   root   -"
    "d /tmp/leavesfiles   0777 leaves leaves -"
  ];

  fileSystems."/leavesfiles/files" = {
    device = "/tmp/leavesfiles";
    fsType = "fuse.bindfs";
    options = [ "force-user=filedrop" "force-group=filedrop" "perms=u=rwD:go=rD" ];
  };

  services.openssh.extraConfig = ''
    Match User leaves
      ChrootDirectory /leavesfiles
      ForceCommand internal-sftp -R -d /tmp/servedfiles
      AuthenticationMethods password
      PasswordAuthentication yes
      KbdInteractiveAuthentication no
  '';
}
