{...}: {
  home.sessionVariables = {
    EDITOR = "neovide";
    BROWSER = "firefox";
  };
  
  programs.git = {
    enable = true;
    userName = "Korimer";
    userEmail = "thekclov@gmail.com";
  };

  imports = [
    inputs.nixCats-nvim.homeManagerModule
  ];
  programs.nixCats-nvim.enable = true;
}
