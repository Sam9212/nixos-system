{ config, pkgs, ... }:

{
	imports = [
		./boot.nix
	  ./drivers.nix
	  ./input.nix
	  ./misc.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.05";
}
