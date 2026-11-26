{ inputs, ... }:
{
  imports = [ inputs.vpn-confinement.nixosModules.default ];
}
