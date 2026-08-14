{ pkgs }:
let
fortune = pkgs.writeShellScriptBin "waybar-fortune" ''
  FILE="$1"

  if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
    printf '{"text":"󰈙","tooltip":"fortune file missing"}\n'
    exit 1
  fi

  FORTUNE=$(shuf -n 1 "$FILE")
  FORTUNE=$(printf '%s' "$FORTUNE" | sed 's/\\/\\\\/g; s/"/\\"/g')

  printf '{"text":"%s"}\n' "$FORTUNE"
'';
in
  fortune
