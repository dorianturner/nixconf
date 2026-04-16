{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    programs.niri.enable = true;

    environment.systemPackages = [
      pkgs.xwayland-satellite
      pkgs.rofi
      pkgs.kitty
    ];

    hjem.users.dorian.files.".config/niri/config.kdl".source = ./niri.kdl;
  };
}