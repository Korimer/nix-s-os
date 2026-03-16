{lib, pkgs, ...}: 
let
  #Builtins with enable
  sys_programs_to_enable = {
    steam = {};
    firefox = import ./programs/firefox.nix {};
    git = {
      package = pkgs.gitFull;
    };
    thunderbird = {};
    zsh = import ./programs/zsh.nix {};
    neovim = {
      vimAlias = true;
      viAlias = true;
    };
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

    # lsps
    jdt-language-server
    basedpyright
    vscode-langservers-extracted

    # cs314
    maven zulu25 postman

    # Dev tools
    wireshark
    live-server
    python3
    grub2_efi
    parted
    powershell

    # neovim
    xclip
    neovide
    tree-sitter
    # idk why lazy-lsp cant install this automatically
    jdt-language-server

    # core system utils
    unzip
    p7zip
    pavucontrol
    mictray
    wget
    ripgrep

    # blue collar maxxing
    slack
    teams-for-linux
    multipath-tools
    vscode

    # slob/larp maxxing
    vesktop

    # idk lol
    openssl
  ];
  
  ###########
  ## Logic ##
  ###########
  sys_programs_enabled = lib.mapAttrs (
      name: value:
      value // {enable = true;}
    )
    sys_programs_to_enable
  ;
  
  sys_programs_complete = lib.recursiveUpdate 
    sys_programs_enabled
    sys_programs_config
  ;
  
in { # yeah the process of actually setting it all is 2 lines lol
  programs = sys_programs_complete;
  environment.systemPackages = sys_pkgs;
}

