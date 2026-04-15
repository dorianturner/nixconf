{ self, inputs, ... }: {

  flake.nixosModules.noctalia = { pkgs, inputs, ... }: {
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.system}.default
    ];

    hjem.users.dorian.files.".config/noctalia/config.json".source = ./noctalia.json;
  };
}
