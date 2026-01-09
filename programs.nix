{lib, pkgs, agenixTar, ...}: 
let
  #Builtins with enable
  sys_programs_to_enable = {
    steam = {};
    firefox = import (./programs/firefox.nix) {};
    git = {};
    thunderbird = {};
    zsh = import (./programs/zsh.nix) {};
    neovim = {};
  };
  # Builtins with toggleable settings
  sys_programs_config = {
#    ssh = {
#      startAgent = true;
#      enableAskPassword = true;
#    };
  };
  
  #Installable packages
  sys_pkgs = with pkgs; [
    ripgrep
    wsdd
    nwg-displays
#    (pkgs.callPackage "${agenixTar}/pkgs/agenix.nix" {})
    discord
    keyutils
    cifs-utils
    xorg.xkill
    wireshark
    remmina
    slack
    neovide
    xclip
    git
    openssl
    powershell
    r2modman
    p7zip
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

