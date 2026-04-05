{
  description = "Kernel Dev Tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ 
          pkgs.fastfetch 
          pkgs.nasm
		  pkgs.gcc
		  pkgs.binutils
		  pkgs.qemu
        ];
      };
    };
}