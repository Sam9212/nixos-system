{ config, pkgs }:

pkgs.stdenv.mkDerivation {
  name = "geode";

  src = pkgs.fetchurl {
    url = "https://geode-sdk.org/install/linux.sh";
    hash = "sha256-XHEaVqHFrO6HtT48KagPGwf/B006cwRJl46fbZOIFco=";
  };

  configurePhase = "ls";

  buildCommand = "bash src/linux.sh";
}
