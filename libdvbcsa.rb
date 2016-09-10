require 'formula'

class Libdvbcsa < Formula
  homepage 'http://www.videolan.org/developers/libdvbcsa.html'
  url 'http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz'
  sha256 '4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-sse2",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
