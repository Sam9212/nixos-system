{ inputs, config, pkgs, ... }:

{
	time.timeZone = "Europe/London";

	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;
	programs.hyprland = {
		enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	users.users.samcg = {
		isNormalUser = true;
		description = "Sam9212";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	programs.bash = {
		interactiveShellInit = ''
			if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
				then
				shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
				exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
			fi
		'';
	};

	programs.firefox.enable = true;
	environment.systemPackages = with pkgs; [
		easyeffects
		jq
	];
}
