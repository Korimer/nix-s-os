{lib, pkgs, agenixTar, ...}: 
let
  #Builtins with enable
  sys_programs_to_enable = {
    steam = {};
    firefox = {};
    git = {};
    thunderbird = {};
    zsh = {
      #enableCompletions = true;
      #autosuggestion.enable = true;
      #syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
	update = "sudo nixos-rebuild switch";
      };
      #history.size = 10000;
    };
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
    (pkgs.callPackage "${agenixTar}/pkgs/agenix.nix" {})
 #   discord
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

