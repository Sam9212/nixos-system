{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland.submaps = {
		"NOR".settings.bind = [
			"$mod, Grave, exec, qs ipc call bar updateMode 'GRP'"
			"$mod, Grave, submap, GRP"

			# Switching Workspaces
			"$mod, Tab, workspace, r+1"
			"$mod SHIFT, Tab, workspace, r-1"
			# "$mod, Grave, movetoworkspace, r+1"
			# "$mod SHIFT, Grave, movetoworkspace, r-1"
			"$mod, mouse_up, resizeactive, 10 10"
			"$mod, mouse_down, resizeactive, -10 -10"

			# Screenshotting
			"$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

			# Opening Slop
			"$mod, T, exec, $terminal"
			"$mod, Space, exec, $launcher"

			"$mod, F, exec, /etc/nixos/home-manager/hypr/togglefloatspace.fish"
			"$mod, F, exec, /etc/nixos/home-manager/hypr/floatall.fish"
		];

		"NOR".settings.bindr = [
			", F12, pass, class:^(discord)$"
		];

		"NOR".settings.bindm = [
			", mouse:274, movewindow"
		];

		"GRP".settings.bind = [
			"$mod, Grave, exec, qs ipc call bar updateMode 'RSZ'"
			"$mod, Grave, submap, RSZ"

			", Q, togglegroup, "
			", W, movewindoworgroup, u"
			", A, movewindoworgroup, l"
			", S, movewindoworgroup, d"
			", D, movewindoworgroup, r"
		];

		"RSZ".settings.bind = [
			"$mod, Grave, exec, qs ipc call bar updateMode 'NOR'"
			"$mod, Grave, submap, NOR"
		];

		"RSZ".settings.binde = [
			", Q, togglegroup, "
			", W, resizeactive, 0 -75"
			", A, resizeactive, -75 0"
			", S, resizeactive, 0 75"
			", D, resizeactive, 75 0"
		];
	};
	
	wayland.windowManager.hyprland.settings = {
		binds = {
			drag_threshold = 20;
		};

		# Global Passthrough
		bindr = [
			# "Ctrl Alt, Alt_L, pass, class:^(discord)$"
		];
	};
}
