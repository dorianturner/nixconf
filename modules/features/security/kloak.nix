{ inputs, ... }:

{
  flake.nixosModules.kloak = { pkgs, ... }:
  {
    nixpkgs.overlays = [
      (final: prev: {
        kloak = import ../../../packages/kloak.nix { pkgs = final; };
      })
    ];

    environment.systemPackages = [ pkgs.kloak ];

    # Enable user service support
    services.dbus.enable = true;


    # WIP, neesd root to run, but root doesn't have the wayland environment vars :(
    # systemd.services.kloak = {
    #   description = "Kloak input anonymization";

    #   wantedBy = [ "graphical.target" ];
    #   after = [ "graphical.target" ];

    #   serviceConfig = {
    #     ExecStart = "${pkgs.kloak}/bin/kloak -d 200";
    #     Restart = "always";

    #     User = "root";

    #     Environment = [
    #       "XDG_RUNTIME_DIR=/run/user/1000"
    #       "WAYLAND_DISPLAY=wayland-1"
    #     ];

    #     # allow input access
    #     SupplementaryGroups = [ "input" "video" ];
    #   };
    # };
  };
}