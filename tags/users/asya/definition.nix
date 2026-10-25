{
  users.groups.asya = {};
  users.users.asya = {
    description = "Service Admin";
    createHome = false;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
