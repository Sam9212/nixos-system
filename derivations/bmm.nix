{ config, pkgs, lib, stdenv, fetchFromGitHub, rustPlatform, fetchNpmDeps, ...}:

rustPlatform.buildRustPackage (finalAttrs: {
	  pname = "balatro-mod-manager";
	  version = "0.4.0";
	  
	  src = fetchFromGitHub {
	    owner = "skyline69";
	    repo = "balatro-mod-manager";
	    tag = "v${finalAttrs.version}";
	    hash = "sha256-ISEgmyGA96r+OolKc/8qiKee43ruNonmWdqfM4pr3p8=";
	  };

		cargoRoot = "src-tauri";
		buildAndTestSubdir = finalAttrs.cargoRoot;
		cargoHash = "sha256-4Kohn/FNu2InvgpiPHP0k10dnlNqBwQToKQCNuCVFHs=";
		
		npmDeps = fetchNpmDeps {
			name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
			inherit (finalAttrs) src;
			hash = "sha256-kK7QN1NIFiB5HSXMhCkZ3DGQXLo9GExu1WcUWdtApK4=";
		};

		nativeBuildInputs = with pkgs; [
			cargo-tauri.hook
			bun
			pkg-config
			go-task
			vite
			qt6.wrapQtAppsHook
			gcc
		] ++ lib.optionals stdenv.hostPlatform.isLinux (with pkgs; [ wrapGAppsHook4 ]);
		
	  buildInputs = lib.optionals stdenv.hostPlatform.isLinux (with pkgs; [
	  	qt6.qtbase
	  	glib-networking
	  	openssl
	  	webkitgtk_4_1
	  ]);

		configurePhase = ''
			echo "gooning pt 1"
		'';

	  buildPhase = ''
	  	export WAYLAND_DISPLAY=
	  	cargo check -j 16 --profile release --target x86_64-unknown-linux-gnu --offline
	  	echo "gooning"
	  '';

		# installPhase = ''
	 #  	/*WAYLAND_DISPLAY=*/ task release-linux
		# '';

})
