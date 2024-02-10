{
  inputs = rec {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    zig-overlay.url = "github:mitchellh/zig-overlay";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    zig = inputs.zig-overlay.packages.x86_64-linux.master-2024-02-10;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        SDL2
        zig
        pkg-config
        gdb
      ];
    };
  };
}
