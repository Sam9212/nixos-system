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
        "easyeffects"
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

      binds = {
        drag_threshold = 20;
      };

      bind = [
        "$mod, t, exec, $terminal"
        "Alt, Space, exec, $launcher"
        "Ctrl, P, exec, qs ipc call launcher toggle"
        
        "$mod, Tab, workspace, r+1"
        "$mod, Tab, exec, qs ipc call update_space_display updateDisplay"

        "$mod SHIFT, Tab, workspace, r-1"
        "$mod SHIFT, Tab, exec, qs ipc call update_space_display updateDisplay"

        "$mod, Grave, movetoworkspace, r+1"
        "$mod SHIFT, Grave, movetoworkspace, r-1"
      ];

      bindm = [
        ", mouse:274, movewindow"
      ];

      windowrule = [
        "float, title:qs-launcher"
        "center, title:qs-launcher"
        "pin, title:qs-launcher"
        "noblur, title:qs-launcher"
        "noborder, title:qs-launcher"
        "noshadow, title:qs-launcher"
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

  # home.file.".config/hypr/xdph.conf".source = config.lib.file.mkOutOfStoreSymlink ./xdph.conf;

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
