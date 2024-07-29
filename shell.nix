{
  pkgs ? import <nixpkgs> { },
}:
let
  pgn-extract = pkgs.callPackage ./pgn-extract.nix { };
in
pkgs.mkShell {
  packages = [
    pkgs.jq
    pkgs.vim
    pgn-extract
  ];
}
