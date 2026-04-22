{ self, inputs, ... }: 

{
  flake.nixosModules.kitty = { pkgs, ... }: {

    environment.systemPackages = [ pkgs.kitty ];

    hjem.users.dorian.files.".config/kitty/kitty.conf".source = ./kitty.conf;
    hjem.users.dorian.files.".config/kitty/GruvBox_DarkHard.conf".source = ./GruvBox_DarkHard.conf;
  };
}