{ config, pkgs, osConfig, ... }:

{
	imports = [
		./binds.nix
		./floating.nix
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;

		settings = {
			"$terminal" = if osConfig.networking.hostName == "selene"
				then "konsole"
				else "kitty";
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
				"hyprctl dispatch submap NOR"
			];

			monitor = [
				"DP-2,3440x1440@180,auto,1"
				",preferred,auto,1"
			];

			general = {
				gaps_in = "8";
				layout = "dwindle";
			};

			dwindle = {
				smart_split = "true";
				preserve_split = "true";
			};

			group.groupbar = {
				
			};

			windowrule = [
				# "workspace emptynm silent, class:steam_app_.+"
				# "focusonactivate, class:zen"

				# "match:class steam_app_.+, workspace emptym silent"
				# "match:class steam_app_.+, float off"

				# "float, title:qs-launcher"
				# "center, title:qs-launcher"
				# "pin, title:qs-launcher"
				# "noblur, title:qs-launcher"
				# "noborder, title:qs-launcher"
				# "noshadow, title:qs-launcher"
			];
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
