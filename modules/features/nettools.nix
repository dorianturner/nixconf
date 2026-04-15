{ self, inputs, ... }:

{
  flake.nixosModules.nettools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dnsutils
      inetutils
      net-tools
      wireshark
    ];

    programs.wireshark.enable = true;
    programs.wireshark.dumpcap.enable = true;
  };
}