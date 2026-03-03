{config,...}:
let 
  _2 = "logging start";
  _ = builtins.trace config.services.openssh.hostKeys;
  _3 = "logging end";
in
{
  age.identityPaths = ["/home/ets-c837275181/.ssh/id_ed25519"];
  age.secrets.secret1.file = "/etc/nixos/system-specific/non-config/secret1.age";
  environment.variables = {F1 = config.age.secrets.secret1.file;};
}
