{
  description = "A minimal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      genSystem =
        system: bootloader:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            bootloader
          ];
        };
    in
    {
      nixosConfigurations = {
        x86_64-grub = genSystem "x86_64-linux" {
          boot.loader.grub.enable = true;
          boot.loader.grub.device = "/dev/sda";
        };
        x86_64-systemd = genSystem "x86_64-linux" {
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
        };
        aarch64-systemd = genSystem "aarch64-linux" {
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
        };
        aarch64-uboot = genSystem "aarch64-linux" {
          boot.loader.grub.enable = false;
          boot.loader.generic-extlinux-compatible.enable = true;
        };
      };
    };
}
