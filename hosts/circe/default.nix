{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  programs.steam.enable = true;

  networking.hostName = "circe";
}
