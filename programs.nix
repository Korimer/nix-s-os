{lib, pkgs, ...}: 
let
  #Builtins with enable
  sys_programs_to_enable = {
    firefox = {};
    git = {};
    thunderbird = {};
    neovim = {
      defaultEditor = true;
    };
  };
  # Builtins with toggleable settings
  sys_programs_config = {
    ssh = {
      startAgent = true;
      enableAskPassword = true;
    };
  };
  
  #Installable packages
  sys_pkgs = with pkgs; [
    ghostty
    remmina
    slack
    neovide
    xclip
    git
  ];
  
  ###########
  ## Logic ##
  ###########
  sys_programs_enabled = lib.mapAttrs (
      name: value:
      value // {enable = true;}
    )
    (sys_programs_to_enable)
  ;
  
  sys_programs_complete = lib.recursiveUpdate 
    sys_programs_enabled
    sys_programs_config
  ;
  
in { # yeah the process of actually setting it all is 2 lines lol
  programs = sys_programs_complete;
  environment.systemPackages = sys_pkgs;
}

