{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pcxs2
  ];
}
