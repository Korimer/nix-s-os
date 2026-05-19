{...}:
{
  imports = [
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/asus/fa507nv"
  ]; 
}
