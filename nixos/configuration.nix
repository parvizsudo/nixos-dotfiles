{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./bundle.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "26.05"; # Don't change it bro.

}
