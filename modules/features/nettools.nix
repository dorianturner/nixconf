{ self, inputs, ... }:

{
  flake.nixosModules.nettools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dnsutils
      inetutils
      wireshark
    ];
  };
}