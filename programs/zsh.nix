{}:
let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
  preset_env = {
    SSH_ENV = "$HOME/.ssh/agent-env";
    SSH_SOCKET="$HOME/.ssh/ssh-agent.sock";
    ELECTRON_OZONE_PLATFORM_HINT="auto";
  };
in {
  syntaxHighlighting.enable = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
    kssh = "kitten ssh";
  };

  shellInit = lib.generators.toKeyValue {
    mkKeyValue = name: value:
    "${name}=\"${value}\"";
  } (preset_env) + ''
    start_agent() {
      echo "Starting new ssh-agent..."
      ssh-agent -a "$SSH_SOCKET" > "$SSH_ENV"
      chmod 600 "$SSH_ENV"
      . "$SSH_ENV" > /dev/null
    }
    
    # Load existing agent if possible
    if [ -f "$SSH_ENV" ]; then
        . "$SSH_ENV" > /dev/null
        export SSH_AUTH_SOCK="$SSH_SOCKET"
        if ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1 || ! ssh-add -l >/dev/null 2>&1; then
            echo "Agent stale. Restarting..."
            rm -f "$SSH_SOCKET" "$SSH_ENV"
            start_agent
        fi
    else
        start_agent
    fi
    
    # Optional: auto-add key if not already present
    if ! ssh-add -l >/dev/null 2>&1; then
        echo "No keys found. Run: ssh-add ~/.ssh/your-ssh-key"
        # Optional auto-add:
        # ssh-add ~/.ssh/your-ssh-key </dev/null
    fi
  '';

  #history.size = 10000;
}
