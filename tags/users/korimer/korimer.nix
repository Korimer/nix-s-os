{ presets, ... }:
{
  users.groups.korimer = {};
  users.users.korimer = {
    createHome = true;
    group = "korimer";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio"];
    description = "the goat";
    password = "lol"; # oh noooo bro my password is exposed
  };
}
