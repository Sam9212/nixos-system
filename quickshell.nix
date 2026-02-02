{ config, pkgs, ... }:

{
  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink ./quickshell;
    recursive = true;
  };

  programs.quickshell = {
    enable = true;
  };
}
