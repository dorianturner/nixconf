{inputs, ...}:

{
  flake.nixosModules.nix-mineral = { ... }:
  {
    imports = [ inputs.nix-mineral.nixosModules.nix-mineral ];

    nix-mineral = {
        enable = true;
        preset = "compatibility";

        settings = {
            # kernel = {
            #     only-signed-modules = true;
            #     lockdown = true;
            #     ...
            # };
            system.multilib = true;
            network = {
                ip-forwarding = true;
            };
        };
    };

    # nix-mineral.settings.network.tcp-window-scaling = false;
  };
}

