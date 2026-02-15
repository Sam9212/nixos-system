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
    (discord.override {
      withVencord = true;
    })
    nerd-fonts.jetbrains-mono
    nerd-fonts.bigblue-terminal
    nerd-fonts.departure-mono
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
      keys.normal = {
        "A-down" = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        "A-up" = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
    };
  };
  
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
      safe.directory = "/etc/nixos";
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
