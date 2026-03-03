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
}
