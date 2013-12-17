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

--- a/asn1tag.c
+++ b/asn1tag.c
@@ -549,4 +549,6 @@
  MATCH(NewVariableValue)
  MATCH(NewTimer)
+ //ADD
+ MATCH(SetInputMask)
 
  fprintf(stderr, "Unknown ASN1TAGCLASS type: %s\n", name);
--- a/asn1tag.h
+++ b/asn1tag.h
@@ -326,4 +326,6 @@
 #define ASN1TAG_GetBitmapDecodeOffset  247
 #define ASN1TAG_SetSliderParameters  248
+//ADD
+#define ASN1TAG_SetInputMask 254
 
 /* tag and class in a single value */
@@ -568,4 +570,7 @@
 #define ASN1TAGCLASS_SetCellPosition ((ASN1CLASS_CONTEXT << 24) | ASN1TAG_SetCellPosition)
 #define ASN1TAGCLASS_SetInputReg ((ASN1CLASS_CONTEXT << 24) | ASN1TAG_SetInputReg)
+//ADD
+#define ASN1TAGCLASS_SetInputMask  ((ASN1CLASS_CONTEXT << 24) | ASN1TAG_SetInputMask)
+
 #define ASN1TAGCLASS_SetTextColour ((ASN1CLASS_CONTEXT << 24) | ASN1TAG_SetTextColour)
 #define ASN1TAGCLASS_SetFontAttributes ((ASN1CLASS_CONTEXT << 24) | ASN1TAG_SetFontAttributes)
--- a/asn1type.c
+++ b/asn1type.c
@@ -219,4 +219,5 @@
  MATCH(XYPosition, SEQUENCE)
  MATCH(SetInputReg, SEQUENCE)  // MATCH(SetInputRegister, SEQUENCE)
+ MATCH(SetInputMask, SEQUENCE) 
  MATCH(SetCellPosition, SEQUENCE)
  MATCH(SetBitmapDecodeOffset, SEQUENCE)
--- a/grammar
+++ b/grammar
@@ -550,4 +550,5 @@
        | SetCellPosition
        | SetInputReg
+       | SetInputMask
        | SetTextColour
        | SetFontAttributes
@@ -737,4 +738,5 @@
 SetCellPosition  ::= ":SetCellPosition" "(" Target Index XPosition YPosition ")" .
 SetInputReg  ::= ":SetInputReg" "(" Target GenericInteger ")" .
+SetInputMask ::= ":SetInputMask" "(" Target GenericOctetString ")" .
 SetTextColour  ::= ":SetTextColour" "(" Target NewColour ")" .
 SetFontAttributes  ::= ":SetFontAttributes" "(" Target GenericOctetString ")" .
