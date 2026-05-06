{ config, pkgs, ... }:

{
	programs.starship = {
	  enable = true;
	  settings = pkgs.lib.importTOML ./tokyo-night.toml;
	};

	programs.helix = {
	  enable = true;
	  settings = {
	    theme = "bogster";
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
		};

		flavors.kanagawa-loc = ./kanagawa.yazi;
		theme.flavor.dark = "kanagawa";
	};

	home.file.".config/zellij" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-manager/shell/zellij";
		recursive = true;
	};

	home.packages = with pkgs; [
		eza
		zellij
	];
}
