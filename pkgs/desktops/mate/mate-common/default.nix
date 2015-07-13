{ stdenv, fetchurl, glib }:

stdenv.mkDerivation {
 version = "1.10.0";
 name = "mate-common";
 src = fetchurl {
  url = "http://pub.mate-desktop.org/releases/1.10/mate-common-1.10.0.tar.xz";
  sha256 = "a2193e5d2ae78aa3f7bdf5636fb46d8142d417be76885758bf3795bc5e73d822";
 };
 buildInputs = [glib];
}

