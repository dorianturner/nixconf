{ self, lib, ... }: {
  flake.nixosConfigurations.asus-tuf = lib.nixosSystem {
    modules = [ 
      self.nixosModules.asus-tuf-configuration 
      
      self.nixosModules.niri
      self.nixosModules.greeter
      self.nixosModules.vscode
      self.nixosModules.devtools
      self.nixosModules.discord
      self.nixosModules.steam
      self.nixosModules.anki
      ];
  };
}
