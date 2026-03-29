{ self, inputs, ... }: {
  flake.nixosConfigurations.asus-tuf = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asus-tuf-configuration
    ];
  };
}
