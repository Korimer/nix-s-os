{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    everest
      (olympus.override {celesteWrapper = "steam-run";})
  ];
}
