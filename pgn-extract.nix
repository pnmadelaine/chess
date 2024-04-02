{stdenv ? (import <nixpkgs> {}).stdenv}:
stdenv.mkDerivation {
  name = "pgn-extract";
  src = builtins.fetchTarball {
    url = "https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-22-11.tgz";
    sha256 = "1i8laxlyxzhx3x8nb28vqvv94869ympg8mzfv5bvclx2hzaci0jk";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp pgn-extract $out/bin
  '';
}
