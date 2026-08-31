{ colors, pkgs, ... }:
let
  appName = "get-nvidia-temp";
  get-nvidia-temp = pkgs.writeShellScriptBin appName ''
    temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

    if [ "$temp" -ge 80 ]; then
        class="critical"
    elif [ "$temp" -ge 65 ]; then
        class="warning"
    else
        class="normal"
    fi

    printf '{"text":"%s","class":"%s"}\n' "$temp" "$class"
  '';
in
{
  name = "custom/gpu-temperature";
  settings = {
    exec = "${get-nvidia-temp}/bin/${appName}";
    return-type = "json";
    format = " {}°C";
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

