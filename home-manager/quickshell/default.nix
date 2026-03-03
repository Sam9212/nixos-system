{ config, pkgs, ... }:

{
  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/quickshell";
    recursive = true;
  };

  programs.quickshell = {
    enable = true;
  };
}
