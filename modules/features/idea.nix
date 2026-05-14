{
  flake.nixosModules.idea = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.jetbrains.idea
    ];

  };
}