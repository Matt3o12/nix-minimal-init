{ config, pkgs, ... }:

let
  user = "matt3o12";
  publicKeys = import ./public-keys.nix;
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking.hostName = "nixos-init"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = publicKeys;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.vim.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    btop
    htop
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}
