{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "kloak";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "Whonix";
    repo = "kloak";
    rev = "a997717";
    hash = "sha256-Shrg621cp6llUGEBqv7kfbpupTvHlsLhPWA+OaVQpNk=";
  };

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.which
    pkgs.wayland-scanner
  ];

  buildInputs = [
    pkgs.libevdev
    pkgs.libinput
    pkgs.wayland
    pkgs.libxkbcommon
    pkgs.udev
  ];

  buildPhase = "make all";

  installPhase = ''
    mkdir -p $out/bin
    cp kloak $out/bin/
  '';
}