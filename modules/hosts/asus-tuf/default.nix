{ self, lib, inputs, ... }: {
  flake.nixosConfigurations.asus-tuf = lib.nixosSystem {
    modules = [
      inputs.hjem.nixosModules.default
      self.nixosModules.hjem-dorian

      self.nixosModules.asus-tuf-configuration 

      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.hyprlock
      self.nixosModules.greeter
      self.nixosModules.kitty

      self.nixosModules.nix-mineral
      # self.nixosModules.kloak broken as only wlroots

      self.nixosModules.vscode
      self.nixosModules.devtools
      self.nixosModules.discord
      self.nixosModules.steam
      self.nixosModules.anki
      self.nixosModules.nettools
      ];

  };
}
