{
  services.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes
}
