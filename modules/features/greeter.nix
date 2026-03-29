{ ... }: 

{
  flake.nixosModules.greeter = { pkgs, lib, config, ... }: {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = lib.concatStringsSep " " [
            (lib.getExe pkgs.tuigreet)
            "--time"
            "--asterisks"
            "--remember"
            "--remember-session"
            "--cmd ${config.programs.niri.package}/bin/niri-session"
          ];
          user = "greeter";
        };
      };
    };

    security.pam.services.swaylock = {};
    environment.systemPackages = [ pkgs.swaylock ];
  };
}