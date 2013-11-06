require 'formula'

class RedbuttonAuthor <Formula
  url 'http://sourceforge.net/projects/redbutton/files/current/redbutton-author-20090727.tar.gz'
  homepage 'http://redbutton.sourceforge.net/'
  sha1 '16e2c44d0c168403c41c43790ac65249ebd74278'

  def patches
    # Original Makefile hardcode the destination path...
    DATA
  end

  def install
    ENV.deparallelize
    system "make"
    system "make install INSTALLDIR=#{prefix}"
  end
end

__END__
--- a/Makefile	2009-07-27 15:52:12.000000000 +0200
+++ b/Makefile	2011-02-11 12:17:05.000000000 +0100
@@ -11,7 +11,7 @@
 #LEX=lex
 #YACC=yacc
 
-DESTDIR=/usr/local
+DESTDIR=$(INSTALLDIR)
 
 MHEGC_OBJS=	mhegc.o	\
 		lex.parser.o	\
@@ -56,6 +56,7 @@
 	${CC} ${CFLAGS} ${DEFS} -o berdecode berdecode.c
 
 install:	mhegc mhegd
+	mkdir -p ${DESTDIR}/bin
 	install -m 755 mhegc ${DESTDIR}/bin
 	install -m 755 mhegd ${DESTDIR}/bin
