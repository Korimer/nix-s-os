{
  den.aspects.asya.provides.ssh-keys = { user, ... }: {
    nixos = {
      users.users.${user.userName}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOieZglZHHs3q+/fO9NZ3b7zfvgscb6q8aaIdAOuIaxu asya@192.168.10.92"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILaN75fMg5bRLVzT7mFLip9rIpZh5oDVZjua8ZNvTmgk korimer@magic"
      ];
    };
  };
}
