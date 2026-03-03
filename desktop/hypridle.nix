{pkgs,...}:
{
  environment.systemPackages = [ pkgs.hypridle ];
  environment.etc."xdg/hypr/hypridle.conf".text = ''
    $lock = swaylock --screenshots --effect-blur 10x5 --clock --indicator -lk
    $unlock = pkill -SIGUSR1 swaylock
    
    general {
      lock_cmd = pidof $lock || $lock
      unlock_cmd = $unlock
      before_sleep_cmd = loginctl lock-session; sleep 1
      after_sleep_cmd = loginctl unlock-session
    }
    
    listener {
      timeout = 150
      on-timeout = notify-send -a Hypridle 'Sleeping soon.'
      on-resume = notify-send -a Hypridle 'Awoken!'
    }
    
    listener {
      timeout = 270
      on-timeout = notify-send -a Hypridle 'Sleeping soon.'
    }
    
    listener {
      timeout = 300
      on-timeout = loginctl lock-session
    }
    
    listener {
      timeout = 330
      on-timeout = "${pkgs.niri}/bin/niri msg action power-off-monitors"
      on-resume = "${pkgs.niri}/bin/niri msg action power-on-monitors"
    }
    
    listener {
      timeout = 1800
      on-timeout = systemctl suspend
    }
  '';
}
