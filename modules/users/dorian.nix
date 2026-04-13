{
  flake.nixosModules.hjem-dorian = {...}: 
  {
    hjem.users.dorian = {
      directory = "/home/dorian";
      clobberFiles = true;
    };
  };
}