let
  hostPkgs = import <nixpkgs> {};
  nixpkgs = (hostPkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "nixos-unstable";
    sha256 = "15fcl29a97f68j1pjywmrjm31rdh1a21jz9airlsbzpl4lc3zhfi";
  });
in
  with import nixpkgs {};
  stdenv.mkDerivation {
    name = "talk";
    buildInputs = [
      pipenv
      python3Full
      python3Packages.pep8
      python3Packages.pytest
      python3Packages.pyyaml
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  }
