{ config, pkgs, ... }:

{
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
}
