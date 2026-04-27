{ config, pkgs, ... }:

{
  # wayland.windowManager.hyprland.settings.workspace = [
  #   "name:floating, gapsin:50"
  # ];

  wayland.windowManager.hyprland.settings.windowrule = [
    "float, workspace:name:floating"
  ];
}
