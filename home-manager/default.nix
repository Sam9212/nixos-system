{ config, pkgs, osConfig, lib, inputs, ... }:

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
			# Wallpaper
			awww

			# Slop
			activate-linux
			fastfetch

			# Fonts
			nerd-fonts.jetbrains-mono
			nerd-fonts.bigblue-terminal
			nerd-fonts.departure-mono

			# Screenshots
			grim
			slurp
			wl-clipboard

			# Minecraft
			prismlauncher

			# Balatro Mod Manager!!!
			# i fucking hate you.
			balatro-mod-manager
			# (callPackage ../derivations/bmm.nix {})
		] ++ lib.optionals (osConfig.networking.hostName == "circe") [
			inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
			(discord.override {
				withVencord = true;
				withOpenASAR = true;
			})
		];
	};

	fonts.fontconfig.enable = true;
}
