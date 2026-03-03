{ config, pkgs, ... }:

{
	time.timeZone = "Europe/London";

	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;
	programs.hyprland.enable = true;

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
