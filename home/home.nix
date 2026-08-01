{ config, pkgs, ... }:

{
  imports = [
    ./bundle.nix
  ];

  home = {
    username = "wizard";
    homeDirectory = "/home/wizard";
    stateVersion = "26.05";
  };
}
