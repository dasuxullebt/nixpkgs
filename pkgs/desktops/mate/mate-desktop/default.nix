{ stdenv, fetchurl, mate_common, intltool, pkgconfig, gtk, dconf, itstool, libxml2, glib, shared_mime_info, makeWrapper }:

stdenv.mkDerivation {
 version = "1.10.1";
 name = "mate-desktop";

 buildInputs = [makeWrapper glib mate_common intltool pkgconfig gtk dconf itstool libxml2 shared_mime_info];

 preFixup  = ''
     wrapProgram "$out/bin/mate-autogen" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
     wrapProgram "$out/bin/mate-doc-common" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk}/share:${shared_mime_info}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
 '';

 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/mate-desktop-1.10.1.tar.xz";
  sha256 = "42d8c088a0313884235bbd8901a40b45614cf60c275841397bcc47a5d7fa48c7";
 };
}

