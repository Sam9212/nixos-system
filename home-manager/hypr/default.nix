{ config, pkgs, osConfig, ... }:

{
	imports = [
		./binds.nix
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
				"awww-daemon"
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
		    "match:workspace name:floating, float on"

				"match:class steam_app_.+, workspace emptynm silent"
				"match:class steam_app_.+, float off"

				"match:class zen, focus_on_activate on"
			];
		};
	};

	home.file.".wallpapers" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-manager/hypr/.wallpapers";
		recursive = true;
	};
}
