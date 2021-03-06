{ stdenv, fetchFromGitHub, scons, pkgconfig, openssl, protobuf, boost, zlib}:

stdenv.mkDerivation rec {
  name = "rippled-${version}";
  version = "0.28.1";

  src = fetchFromGitHub {
    owner = "ripple";
    repo = "rippled";
    rev = version;
    sha256 = "0wh8dwdg0gp7smcx40cpqanl2m2hihmx3irqh692svakbl3df3vz";
  };

  postPatch = ''
    sed -i -e "s@ENV = dict.*@ENV = os.environ@g" SConstruct
  '';

  buildInputs = [ scons pkgconfig openssl protobuf boost zlib ];

  buildPhase = "scons";

  installPhase = ''
    mkdir -p $out/bin
    cp build/rippled $out/bin/
  '';

  meta = with stdenv.lib; {
    description = "Ripple P2P payment network reference server";
    homepage = https://ripple.com;
    maintainers = [ maintainers.emery maintainers.offline ];
    license = licenses.isc;
    platforms = [ "x86_64-linux" ];
  };
}
