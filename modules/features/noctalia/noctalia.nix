{ self, inputs, ... }: {

  flake.nixosModules.noctalia = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.system}.default
    ];

    hjem.users.dorian.files.".config/noctalia/config.json".source = ./noctalia.json;
  };
}
