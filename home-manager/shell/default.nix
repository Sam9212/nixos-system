{ config, pkgs, ... }:

{
	programs.starship = {
	  enable = true;
	  settings = pkgs.lib.importTOML ./tokyo-night.toml;
	};

	programs.helix = {
	  enable = true;
	  defaultEditor = true;
	  settings = {
	    theme = "vesper";
	    keys.normal = {
	      "A-down" = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
	      "A-up" = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
	    };
	  };
	};

	programs.fish = {
	  enable = true;
	  shellAliases = {
	    nrs = "sudo nixos-rebuild switch";
	  };
	};

	programs.yazi = {
		enable = true;
		shellWrapperName = "y";
		settings = {
			mgr = {
				ratio = [
					0
					1
					0
				];
			};

			opener.edit = [{
				run = "zellij ac write-chars --pane-id 1 \":o %s\" && zellij ac send-keys --pane-id 1 \"Enter\"";
				orphan = true;
				desc = "Edit in zellij pane";
			}];

			open.rules = [{
				url = "*";
				use = "edit";
			}];
		};

		theme = {
			indicator.padding = {
				open = "▐";
				close = "▌";
			};

			status = {
				sep_left = { open = ""; close = ""; };
				sep_right = { open = ""; close = ""; };
			};
		};
	};

	home.file.".config/zellij" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-manager/shell/zellij";
		recursive = true;
	};

	home.packages = with pkgs; [
		eza
		zellij

		lua-language-server
	];
}
