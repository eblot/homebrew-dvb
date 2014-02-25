require "formula"

class Libbitstream < Formula
  homepage ""
  url "http://download.videolan.org/pub/videolan/bitstream/1.0/bitstream-1.0.tar.bz2"
  head 'git://git.videolan.org/bitstream.git'
  sha1 "efcee178cf81c51c34b57a9a37c27d641a9a375f"

  def install
    # no build, only install header files
    system "make", "install", "PREFIX=#{prefix}"
  end
end
