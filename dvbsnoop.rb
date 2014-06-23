require 'formula'

class Dvbsnoop < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-1.4.50/dvbsnoop-1.4.50.tar.gz'
  sha1 '16dc52337c2431bbcbad78e06abbdb19481da4ec'

  resource "linuxdvbheaders" do
    url  'https://github.com/eblot/linuxdvbheaders.git'
  end

  def patches
    DATA
  end

  def install
    coredir = Dir.pwd

    resource("linuxdvbheaders").stage do
        system "ditto", Dir.pwd, coredir+'/src'
    end

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

__END__
diff --git a/src/misc/crc32.c b/src/misc/crc32.c
index 243f3f8..495a21b 100755
--- a/src/misc/crc32.c
+++ b/src/misc/crc32.c
@@ -17,14 +17,14 @@ $Id: crc32.c,v 1.2 2006/01/02 18:24:04 rasc Exp $
 
 
 
-#include <sys/types.h>
+#include <stdint.h>
 #include "crc32.h"
 
 
 
 // CRC32 lookup table for polynomial 0x04c11db7
 
-static u_long crc_table[256] = {
+static uint32_t crc_table[256] = {
 	0x00000000, 0x04c11db7, 0x09823b6e, 0x0d4326d9, 0x130476dc, 0x17c56b6b,
 	0x1a864db2, 0x1e475005, 0x2608edb8, 0x22c9f00f, 0x2f8ad6d6, 0x2b4bcb61,
 	0x350c9b64, 0x31cd86d3, 0x3c8ea00a, 0x384fbdbd, 0x4c11db70, 0x48d0c6c7,
@@ -69,10 +69,10 @@ static u_long crc_table[256] = {
 	0x933eb0bb, 0x97ffad0c, 0xafb010b1, 0xab710d06, 0xa6322bdf, 0xa2f33668,
 	0xbcb4666d, 0xb8757bda, 0xb5365d03, 0xb1f740b4};
 
-u_long crc32 (char *data, int len)
+uint32_t crc32 (char *data, int len)
 {
 	register int i;
-	u_long crc = 0xffffffff;
+	uint32_t crc = 0xffffffff;
 
 	for (i=0; i<len; i++)
 		crc = (crc << 8) ^ crc_table[((crc >> 24) ^ *data++) & 0xff];
diff --git a/src/misc/crc32.h b/src/misc/crc32.h
index 94c5089..337508e 100755
--- a/src/misc/crc32.h
+++ b/src/misc/crc32.h
@@ -19,8 +19,9 @@ $Id: crc32.h,v 1.2 2006/01/02 18:24:04 rasc Exp $
 #ifndef __CRC32_H
 #define __CRC32_H
 
+#include <stdint.h>
 
-u_long crc32 (char *data, int len);
+uint32_t crc32 (char *data, int len);
 
 
 #endif
diff --git a/src/sections/sectables.c b/src/sections/sectables.c
index a7bb272..3049fd6 100755
--- a/src/sections/sectables.c
+++ b/src/sections/sectables.c
@@ -268,8 +268,9 @@ void decodeSI_packet (u_char *buf, int len, u_int pid)
   opt = getOptionPtr();
   softcrc_fail = 0;
 
-  if (opt->soft_crc) {
-    u_long crc = crc32 ((char *)buf,len);
+  // CRC32 only exists when 2nd byte MSB is set
+  if (opt->soft_crc && (len > 1) && (buf[1] & 0x80) ) {
+    uint32_t crc = crc32 ((char *)buf,len);
     if (crc) {
 	softcrc_fail = 1;
     }
diff --git a/configure b/configure
index 368d337..6440f2d 100755
--- a/configure
+++ b/configure
@@ -11,6 +11,8 @@
 ## M4sh Initialization.  ##
 ## --------------------- ##
 
+export CFLAGS="-I${PWD}/src/include"
+
 # Be Bourne compatible
 if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
   emulate sh
diff --git a/src/dvbsnoop.h b/src/dvbsnoop.h
index 0304dff..7cf8da6 100755
--- a/src/dvbsnoop.h
+++ b/src/dvbsnoop.h
@@ -112,6 +112,7 @@ dvbsnoop v0.7  -- Commit to CVS
 #include <string.h>
 #include <time.h>
 #include <ctype.h>
+#include <sys/types.h>
 
 #include "version.h"
 #include "misc/helper.h"
