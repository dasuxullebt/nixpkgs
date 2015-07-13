{ stdenv, fetchurl, pkgconfig, gtk, mate_desktop, glib, pango, libxml2, intltool, libunique, gconf, shared_mime_info, makeWrapper }:

stdenv.mkDerivation {
 version = "1.10.1";
 name = "caja";

 buildInputs = [pkgconfig gtk mate_desktop glib pango libxml2 intltool libunique gconf shared_mime_info makeWrapper];

  preFixup = ''
    wrapProgram "$out/bin/caja" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
  '';


 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/caja-1.10.1.tar.xz";
  sha256 = "da32df394d858ce48f53d4cfb1a5a7949180cb8dcaedf9d231fbadb9a74bdb71";
 };
}

