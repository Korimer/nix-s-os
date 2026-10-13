{ ... }:
{
  systemd.sleep.settings.Sleep.HibernateMode = "platform";
  boot.kernelParams = [
    "pcie_aspm=off"
      "acpi.prefer_microsoft_dsm_guid=1"
  ];
  environment.etc."mypulse".text = "HELP";
  system.stateVersion = "25.05";
}
