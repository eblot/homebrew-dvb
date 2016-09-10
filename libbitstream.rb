require "formula"

class Libbitstream < Formula
  homepage ""
  url "http://download.videolan.org/pub/videolan/bitstream/1.0/bitstream-1.0.tar.bz2"
  head 'git://git.videolan.org/bitstream.git'
  sha256 "3a3837270e6e6715d8f4e4a7b2d4b18e85cf66eb54397c3162e160f1c29a1f13"

  def install
    # no build, only install header files
    system "make", "install", "PREFIX=#{prefix}"
  end
end
