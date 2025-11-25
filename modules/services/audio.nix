{ ... }:
{
  # Disable PulseAudio in favor of PipeWire
  services.pulseaudio.enable = false;

  # Enable RealtimeKit for audio priority
  security.rtkit.enable = true;

  # PipeWire audio server
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
