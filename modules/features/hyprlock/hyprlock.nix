{ self, inputs, ... }: {
  flake.nixosModules.hyprlock = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.hyprlock ];
    hjem.users.dorian.files.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  };
}