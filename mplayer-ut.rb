require 'formula'

class MplayerUt < Formula
  homepage 'http://www.mplayerhq.hu/'

  stable do
    url 'http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz'
    sha256 'ce8fc7c3179e6a57eb3a58cb7d1604388756b8a61764cc93e095e7aff3798c76'

    # patch :p1 do
    #   # Fix compilation on 10.9, adapted from upstream revision r36500
    #   url 'https://gist.githubusercontent.com/jacknagel/7441175/raw/37657c264a6a3bb4d30dee14538c367f7ffccba9/vo_corevideo.h.patch'
    #   sha256 "395408a3dc9c3db2b5c200b8722a13a60898c861633b99e6e250186adffd1370"
    # end

    patch :p1 do
      # Add support for UDP timeout
      url 'https://gist.githubusercontent.com/eblot/9068469/raw/121acb2329c219dd3e39b40df60217c33aacd8c7/Add-an-option-to-change-the-UDP-timeout-for-playback.patch'
      sha256 '0f38eaefcabc2ebf8b893e1a9abc3193297251f6bcb3b5b223d873c7a55b65fc'
    end
  end

  head do
    url "svn://svn.mplayerhq.hu/mplayer/trunk", :using => StrictSubversionDownloadStrategy

    # When building SVN, configure prompts the user to pull FFmpeg from git.
    # Don't do that.
    patch :DATA
  end

  option 'with-x', 'Build with X11 support'
  option 'without-osd', 'Build without OSD'

  depends_on 'yasm' => :build
  depends_on 'libcaca' => :optional
  depends_on :x11 if build.with? 'x'

  if build.with? 'osd' or build.with? 'x'
    # These are required for the OSD. We can get them from X11, or we can
    # build our own.
    depends_on "fontconfig"
    depends_on "freetype"
    depends_on "libpng"
  end

  fails_with :clang do
    build 211
    cause 'Inline asm errors during compile on 32bit Snow Leopard.'
  end unless MacOS.prefer_64_bit?

  def install
    # It turns out that ENV.O1 fixes link errors with llvm.
    ENV.O1 if ENV.compiler == :llvm

    # we disable cdparanoia because homebrew's version is hacked to work on OS X
    # and mplayer doesn't expect the hacks we apply. So it chokes.
    # Specify our compiler to stop ffmpeg from defaulting to gcc.
    # Disable openjpeg because it defines int main(), which hides mplayer's main().
    # This issue was reported upstream against openjpeg 1.5.0:
    # http://code.google.com/p/openjpeg/issues/detail?id=152
    args = %W[
      --prefix=#{prefix}
      --cc=#{ENV.cc}
      --host-cc=#{ENV.cc}
      --disable-cdparanoia
      --disable-libopenjpeg
    ]

    args << "--enable-menu" if build.with? 'osd'
    args << "--disable-x11" if build.without? 'x'
    args << "--enable-freetype" if build.with?('osd') || build.with?('x')
    args << "--enable-caca" if build.with? 'libcaca'

    system "./configure", *args
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/mplayer", "-ao", "null", "/System/Library/Sounds/Glass.aiff"
  end
end

__END__
diff --git a/configure b/configure
index a1fba5f..5deaa80 100755
--- a/configure
+++ b/configure
@@ -49,8 +49,6 @@ if test -e ffmpeg/mp_auto_pull ; then
 fi

 if ! test -e ffmpeg ; then
-    echo "No FFmpeg checkout, press enter to download one with git or CTRL+C to abort"
-    read tmp
     if ! git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git ffmpeg ; then
         rm -rf ffmpeg
         echo "Failed to get a FFmpeg checkout"
