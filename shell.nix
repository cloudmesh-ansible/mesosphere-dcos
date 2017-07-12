{ pkgs ? import ./nixpkgs.nix
, venvdir ? ".venv"
}:

with pkgs;

let
  pyEnv = python27Full.withPackages (self: with self; [
    pip
    virtualenv
  ]);

  systemDeps = [
    awscli
    cacert
    libffi
    openssl
    pkgconfig
    sqlite
    zlib
  ];

  devDeps = [ file which ];

  allDeps = [pyEnv] ++ systemDeps ++ devDeps;

in

stdenv.mkDerivation {
  name = "cloudmesh_client_env";
  buildInputs = allDeps;
  shellHook = ''

    export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
    export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)
    export AWS_REGION=$(aws configure get default.region)

    # https://github.com/pikajude/darwinixpkgs/blob/master/doc/languages-frameworks/python.md
    # fixes: ZIP does not support timestamps before 1980
    export SOURCE_DATE_EPOCH=$(date +%s)

    export SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt
    test -d ${venvdir} || virtualenv ${venvdir}
    source ${venvdir}/bin/activate

  '';
}
