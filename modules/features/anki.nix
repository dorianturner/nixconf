{
  flake.nixosModules.anki = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.anki-bin
    ];
  };
}