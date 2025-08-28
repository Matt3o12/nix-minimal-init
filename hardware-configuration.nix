{
  imports = [
    (builtins.abort "Please generate a hardware configuration for your host by running: nixos-generate-config --show-hardware-config > hardware-configuration.nix")
  ];
}
