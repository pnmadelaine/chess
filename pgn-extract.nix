{
  stdenv ? (import <nixpkgs> { }).stdenv,
}:
stdenv.mkDerivation {
  name = "pgn-extract";
  src = builtins.fetchTarball {
    url = "https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-24-11.tgz";
    sha256 = "01lpsq23f2irj5kggahaqgjd51s0hpp3rp0gpvs3y6l2nwri1gmi";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp pgn-extract $out/bin
  '';
}
