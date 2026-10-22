{
  systemd.tmpfiles.rules = [
    # All lab admins get rwx via ACL
    "A /etc/nixos - - - - g:lab\ admins:rwx"
  ];
}
