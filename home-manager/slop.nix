{ config, pkgs, ... }:

{
  programs.rofi.enable = true;
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
      ];

      userSettings = {
        "files.autoSave" = "afterDelay";
      };
    };
  };
}
