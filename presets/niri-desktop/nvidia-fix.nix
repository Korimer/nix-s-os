let
  profilepath = "nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json";
in
{
  # See https://niri-wm.github.io/niri/Nvidia.html#high-vram-usage-fix
  environment.etc.${profilepath}.source = ./niri-nvidia-profile.json;
}
