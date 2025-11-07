{...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.k = {
    isNormalUser = true;
    description = "k";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
