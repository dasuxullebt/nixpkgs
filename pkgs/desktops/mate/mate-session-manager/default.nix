{ stdenv, fetchurl, makeWrapper, mate_desktop, mate_common, intltool, pkgconfig, gtk, dbus_glib, systemd, upower-old, shared_mime_info, libxslt, docbook_xsl, marco, glib }:

stdenv.mkDerivation {
 version = "1.10.1";
 name = "mate-session-manager";

 buildInputs = [ makeWrapper mate_desktop mate_common intltool pkgconfig gtk dbus_glib systemd upower-old shared_mime_info libxslt docbook_xsl marco glib ];

  configureFlags="--enable-upower";

  preFixup = ''
    wrapProgram "$out/bin/mate-session" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/mate-session-inhibit" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/mate-session-properties" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/mate-session-save" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/mate-wm" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
  '';


 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/mate-session-manager-1.10.1.tar.xz";
  sha256 = "8b46a5223e3bb6b12c418e8b2f6cf7b9eea397c6e0859fc65ea52999d3908dfe";
 };
}
