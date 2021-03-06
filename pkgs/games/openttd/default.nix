{ stdenv, fetchurl, pkgconfig, SDL, libpng, zlib, xz, freetype, fontconfig }:

stdenv.mkDerivation rec {
  name = "openttd-${version}";
  version = "1.5.1";

  src = fetchurl {
    url = "http://binaries.openttd.org/releases/${version}/${name}-source.tar.xz";
    sha256 = "0jcg8b0jbiw5kg7rqqw74hdh675r08pgm95grk9ch4z2gpjpd3n9";
  };

  buildInputs = [ SDL libpng pkgconfig xz zlib freetype fontconfig ];
  prefixKey = "--prefix-dir=";

  configureFlags = [
    "--with-zlib=${zlib}/lib/libz.a"
    "--without-liblzo2"
  ];

  makeFlags = "INSTALL_PERSONAL_DIR=";

  postInstall = ''
    mv $out/games/ $out/bin
  '';

  meta = {
    description = ''Open source clone of the Microprose game "Transport Tycoon Deluxe"'';
    longDescription = ''
      OpenTTD is a transportation economics simulator. In single player mode,
      players control a transportation business, and use rail, road, sea, and air
      transport to move goods and people around the simulated world.

      In multiplayer networked mode, players may:
        - play competitively as different businesses
        - play cooperatively controlling the same business
        - observe as spectators
    '';
    homepage = http://www.openttd.org/;
    license = stdenv.lib.licenses.gpl2;
    platforms = stdenv.lib.platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ jcumming the-kenny ];
  };
}
