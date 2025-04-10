{
  lib,
  stdenv,
  fetchurl,
  which,
}:

stdenv.mkDerivation rec {
  pname = "gnome-common";
  version = "2.34.0";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-common/${lib.versions.majorMinor version}/gnome-common-${version}.tar.bz2";
    sha256 = "1pz13mpp09q5s3bikm8ml92s1g0scihsm4iipqv1ql3mp6d4z73s";
  };

  propagatedBuildInputs = [ which ]; # autogen.sh which is using gnome-common tends to require which

  patches = [
    (fetchurl {
      name = "gnome-common-patch";
      url = "https://bug697543.bugzilla-attachments.gnome.org/attachment.cgi?id=240935";
      sha256 = "17abp7czfzirjm7qsn2czd03hdv9kbyhk3lkjxg2xsf5fky7z7jl";
    })
  ];
}
