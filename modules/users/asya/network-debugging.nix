{
  den.aspects.asya.provides.network-debug = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ toybox tcpdump ];
    };
  };
}
