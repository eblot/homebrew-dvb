require 'formula'

class Libdvbcsa < Formula
  homepage 'http://www.videolan.org/developers/libdvbcsa.html'
  url 'http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz'
  sha1 '5f4640a7e93ae6494f24a881414e5c343f803365'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-sse2",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
