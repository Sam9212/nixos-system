{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland.settings = {
			binds = {
				drag_threshold = 20;
			};

			bind = [
				"$mod, t, exec, $terminal"
				"Alt, Space, exec, $launcher"
				"Ctrl, P, exec, qs, ipc call launcher toggle"
				
				# Global Passthrough
				"Ctrl, Alt, pass, class:discord"

				"$mod, Tab, workspace, r+1"
				"$mod SHIFT, Tab, workspace, r-1"

				"$mod, Grave, movetoworkspace, r+1"
				"$mod SHIFT, Grave, movetoworkspace, r-1"
			];

			bindm = [
				", mouse:274, movewindow"
			];
	};
}
