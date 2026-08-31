{ colors, pkgs, ... }:
let
  appName = "get-cpu-temp";
  get-cpu-temp = pkgs.writeShellScriptBin appName ''
    temp=$(sensors -j | ${pkgs.jq}/bin/jq -r '
      .. | objects
      | select(has("Package id 0"))
      | .["Package id 0"].temp1_input
    ' | head -n1 | cut -d. -f1)

    if [ "$temp" -ge 80 ]; then
        class="critical"
    elif [ "$temp" -ge 65 ]; then
        class="warning"
    else
        class="normal"
    fi

    printf '{"text":" %s°C","class":"%s"}\n' "$temp" "$class"
  '';
in
{
  name = "custom/cpu-temperature";
  settings = {
    exec = "${get-cpu-temp}/bin/${appName}";
    return-type = "json";
    format = "{}";
    interval = 5;
  };

  style.base = {
    background-color = colors.green;
  };

  style.bySelector.".critical" = {
    background-color = colors.red;
  };

  style.bySelector.".warning" = {
    color = colors.yellow;
  };
}
