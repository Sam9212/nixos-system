{ inputs, config, pkgs, osConfig, ... }:

{
	# wayland.windowManager.hyprland = {
	# 	enable = true;
	# 	xwayland.enable = true;
	# 	configType = "lua";

 #    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
 #    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

	# 	extraConfig = "require \"~/.config/hyprlua/hyprland.lua\"";
	# };

	home.file.".wallpapers" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-manager/hypr/.wallpapers";
		recursive = true;
	};

	home.file.".config/hypr" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-manager/hypr";
		recursive = true;
	};
}
