{ stdenv, fetchurl, mate_desktop, mate_common, intltool, pkgconfig, gtk, libxml2, mate-icon-theme, libsecret, poppler, djvulibre, itstool, dbus_glib, shared_mime_info, makeWrapper, glib }:

stdenv.mkDerivation {
 version = "1.10.0";
 name = "atril";

 buildInputs = [ mate_desktop mate_common intltool pkgconfig gtk libxml2 mate-icon-theme libsecret poppler djvulibre itstool dbus_glib shared_mime_info makeWrapper glib ];

 configureFlags = "--disable-caja";

  preFixup = ''
    wrapProgram "$out/bin/atril" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
  '';

 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/atril-1.10.0.tar.xz";
  sha256 = "de74bb8d20290b9aab4f5e6e6c58d4e14a979e4914409cb1803522120d814181";
 };
}

