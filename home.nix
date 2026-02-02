{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./quickshell.nix
  ];
  
  home.username = "samcg";
  home.homeDirectory = "/home/samcg";

  home.packages = with pkgs; [
    neofetch
    vesktop
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./tokyo-night.toml;
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "bogster";
    };
  };

  programs.fish.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.4";
      background = "#0a0a0a";
      background_blur = "1";
      
      hide_window_decorations = "yes";
      font_family = "JetBrainsMono NFM";
    };
  };

  programs.rofi = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Sam9212";
        email = "sammcgreeghan@icloud.com";
      };
    };
  };

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

  home.stateVersion = "25.11";
}
