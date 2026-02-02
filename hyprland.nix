{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    
    settings = {
      "$terminal" = "kitty";
      "$launcher" = "rofi -show run";
      "$mod" = "SUPER";

      input = {
        kb_layout = "gb";
        sensitivity = "-0.1";
      };

      exec-once = [
        "hyprpaper"
        "quickshell"
      ];

      monitor = [
        "DP-2,3440x1440@180,auto,1"
        ",preferred,auto,1"
      ];

      general = {
        gaps_in = "10";
        
        layout = "dwindle";
      };

      bind = [
        "$mod, t, exec, $terminal"
        "Alt, Space, exec, $launcher"
        
        "$mod, Tab, workspace, r+1"
        "$mod, Tab, exec, qs ipc call update_space_display updateDisplay"

        "$mod SHIFT, Tab, workspace, r-1"
        "$mod SHIFT, Tab, exec, qs ipc call update_space_display updateDisplay"
      ];
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = "1";
      };
    };
  };

  home.file.".wallpapers" = {
    source = config.lib.file.mkOutOfStoreSymlink ./.wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.wallpapers/wallpaper.jpg"
      ];

      wallpaper = [
        "DP-2,~/.wallpapers/wallpaper.jpg"
        ",~/.wallpapers/wallpaper.jpg"
      ];
    };
  };
}
