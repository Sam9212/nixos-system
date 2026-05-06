{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "match:workspace name:floating, float on"
  ];
}
