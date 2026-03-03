{ config, pkgs, osConfig, lib, ... }:

{
	imports = [
		./dunst.nix
		./git.nix
		./hypr
		./kitty.nix
		./quickshell
		./shell
		./slop.nix
	];
	
	home = {
		username = "samcg";
		homeDirectory = "/home/samcg";
		stateVersion = "25.11";

		packages = with pkgs; [
			# Slop
			activate-linux
			neofetch
			fastfetch

			# Fonts
			nerd-fonts.jetbrains-mono
			nerd-fonts.bigblue-terminal
			nerd-fonts.departure-mono
		] ++ lib.optionals (osConfig.networking.hostName == "circe") [
			(discord.override {
				withVencord = true;
			})
		];
	};

	fonts.fontconfig.enable = true;
}
