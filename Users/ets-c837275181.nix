{pkgs, ...}: {

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };
  
  programs.git = {
    enable = true;
    userName = "Korimer";
    userEmail = "thekclov@gmail.com";
  };

  home.packages = with pkgs; [
    emacs
  ];
}
