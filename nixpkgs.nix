with import <nixpkgs> {};

let

  # to update, run:
  # nix-prefetch-git git://github.com/NixOS/nixpkgs-channels refs/heads/nixpkgs-unstable
  src = pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "50831d543d37bb2953386922c6b5c7488f9028ba"; # 2017/07/08
    sha256 = "0ws52hjky304f0pf81qabk4ry5sxhg6zbbhrmfw899bi2v1069ma";
  };

  pinned-pkgs = import src {};

in
pinned-pkgs
