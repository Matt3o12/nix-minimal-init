# Nix Minimal Init

This is a minimal NixOS configuration for fresh NixOS hosts. The goal is not to configure my nix system, instead it's a minimal working nix that:

*   creates my users
*   enables ssh and root for it (without password) using all publics keys from public-keys.nix

The idea is to keep it as simple as possible with good defaults for all systems. Optionally, I should just be able to copy the hardware-configuration file in there.

**This is a private project, but you can use it as a template for your own minimal NixOS configuration.**

## Usage

1.  Clone this repository to your new NixOS host.
2.  Generate a hardware configuration for your host by running: `nixos-generate-config --show-hardware-config > hardware-configuration.nix`
3.  Replace the placeholder in `public-keys.nix` with your actual public SSH key.
4.  Build the desired configuration using `sudo nixos-rebuild switch --flake .#<configuration_name>`.

Available configurations:

*   `x86_64-grub`: for x86_64 systems using GRUB with legacy BIOS.
*   `x86_64-systemd`: for x86_64 systems using systemd-boot with UEFI.
*   `aarch64-systemd`: for aarch64 systems using systemd-boot with UEFI.
*   `aarch64-uboot`: for aarch64 systems using U-Boot.
