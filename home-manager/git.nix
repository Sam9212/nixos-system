{ config, pkgs, ... }:

{
	programs.git = {
	  enable = true;
	  settings = {
	    user = {
	      name = "Sam9212";
	      email = "sammcgreeghan@icloud.com";
	    };
	    safe.directory = "/etc/nixos";
	  };
	};
}
