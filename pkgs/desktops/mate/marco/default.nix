{ stdenv, fetchurl, makeWrapper, mate_common, intltool, glib, pkgconfig, gtk, libcanberra, zenity, itstool, libxml2, shared_mime_info, mate_desktop}:

stdenv.mkDerivation {
 version = "1.10.1";
 name = "marco";

 buildInputs = [pkgconfig makeWrapper mate_common intltool glib pkgconfig gtk libcanberra zenity itstool libxml2 shared_mime_info mate_desktop];

  preFixup = ''
    wrapProgram "$out/bin/marco" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/marco-message" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/marco-theme-viewer" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
    wrapProgram "$out/bin/marco-window-demo" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
  '';


 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/marco-1.10.1.tar.xz";
  sha256 = "e50fa7b0fea52a4aad0bfa99f204f1f320c704f48d4f945cc40a65546601c1d0";
 };
}

