require 'formula'

class Opencaster < Formula
  homepage ''
  url 'http://ftp.de.debian.org/debian/pool/main/o/opencaster/opencaster_3.2.1+dfsg.orig.tar.gz'
  sha1 '9b2b2c68573d9479324547725438ded774ff4ccc'
  version '3.2.1'

  def patches
    DATA
  end

  def install
    system "make", "install"
  end

end

__END__
diff --git a/libs/dvbobjects/setup.py b/libs/dvbobjects/setup.py
index 28ea451..e30407e 100755
--- a/libs/dvbobjects/setup.py
+++ b/libs/dvbobjects/setup.py
@@ -8,7 +8,7 @@ import sys
 
 _ext_modules = None
 
-if sys.platform in ['linux2', 'solaris2', 'win32']:
+if sys.platform in ['linux2', 'solaris2', 'win32', 'darwin']:
     _ext_modules = [ Extension('dvbobjects.utils._crc32', [ 'sectioncrc.py.c'] ), ]
 
 setup(
diff --git a/tools/dsmcc-receive/dsmcc-receive.c b/tools/dsmcc-receive/dsmcc-receive.c
index 9141e00..d2b9ecb 100644
--- a/tools/dsmcc-receive/dsmcc-receive.c
+++ b/tools/dsmcc-receive/dsmcc-receive.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/i13942ts/i13942ts.c b/tools/i13942ts/i13942ts.c
index 6005976..aa0b598 100644
--- a/tools/i13942ts/i13942ts.c
+++ b/tools/i13942ts/i13942ts.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/ip2sec/Makefile b/tools/ip2sec/Makefile
index 3a90c82..6b43201 100644
--- a/tools/ip2sec/Makefile
+++ b/tools/ip2sec/Makefile
@@ -4,7 +4,7 @@ LDFLAGS  += -lpcap
 
 OBJS    = ip2sec.o ../../libs/sectioncrc/sectioncrc.o
 TARGET  = ip2sec
-DESTDIR = /usr/local/bin/
+DESTDIR ?= /usr/local/bin/
 
 all: $(TARGET)
 
diff --git a/tools/mpeg2videovbv/vbv.c b/tools/mpeg2videovbv/vbv.c
index 74183a1..055078c 100644
--- a/tools/mpeg2videovbv/vbv.c
+++ b/tools/mpeg2videovbv/vbv.c
@@ -20,10 +20,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/pesaudio2ts/pesaudio2ts.c b/tools/pesaudio2ts/pesaudio2ts.c
index 8eb43b5..e6387c1 100644
--- a/tools/pesaudio2ts/pesaudio2ts.c
+++ b/tools/pesaudio2ts/pesaudio2ts.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/pesdata2ts/Makefile b/tools/pesdata2ts/Makefile
index 3e180f7..2d9a2d7 100644
--- a/tools/pesdata2ts/Makefile
+++ b/tools/pesdata2ts/Makefile
@@ -4,7 +4,7 @@ LDFLAGS  += -lc
 
 OBJS = pesdata2ts.o
 TARGET = pesdata2ts
-DESTDIR = /usr/local/bin/
+DESTDIR ?= /usr/local/bin/
 
 all: $(TARGET)
 
diff --git a/tools/pesdata2ts/pesdata2ts.c b/tools/pesdata2ts/pesdata2ts.c
index 166e8af..1c6fab3 100644
--- a/tools/pesdata2ts/pesdata2ts.c
+++ b/tools/pesdata2ts/pesdata2ts.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/pesvideo2ts/pesvideo2ts.c b/tools/pesvideo2ts/pesvideo2ts.c
index 34f96eb..5dd7cf4 100644
--- a/tools/pesvideo2ts/pesvideo2ts.c
+++ b/tools/pesvideo2ts/pesvideo2ts.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/sec2ts/sec2ts.c b/tools/sec2ts/sec2ts.c
index b97fff4..2b83797 100644
--- a/tools/sec2ts/sec2ts.c
+++ b/tools/sec2ts/sec2ts.c
@@ -23,10 +23,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/tsdoubleoutput/tsdoubleoutput.c b/tools/tsdoubleoutput/tsdoubleoutput.c
index ff56e13..0f42670 100644
--- a/tools/tsdoubleoutput/tsdoubleoutput.c
+++ b/tools/tsdoubleoutput/tsdoubleoutput.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsinputswitch/tsinputswitch.c b/tools/tsinputswitch/tsinputswitch.c
index 5a97e19..faca6de 100644
--- a/tools/tsinputswitch/tsinputswitch.c
+++ b/tools/tsinputswitch/tsinputswitch.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsnullshaper/Makefile b/tools/tsnullshaper/Makefile
index 2071129..f817062 100644
--- a/tools/tsnullshaper/Makefile
+++ b/tools/tsnullshaper/Makefile
@@ -1,6 +1,6 @@
 C      = gcc
 CFLAGS  += -g -MD -Wall -I. -I../../include -D_FILE_OFFSET_BITS=64 $(CPPFLAGS)
-LDFLAGS  += -lc -lrt
+LFLAGS  = -lc
 
 OBJS = tsnullshaper.o
 TARGET = tsnullshaper
diff --git a/tools/tsnullshaper/tsnullshaper.c b/tools/tsnullshaper/tsnullshaper.c
index 470c96a..fb9b9cc 100644
--- a/tools/tsnullshaper/tsnullshaper.c
+++ b/tools/tsnullshaper/tsnullshaper.c
@@ -46,6 +46,40 @@ fd_queue* g_fd_time_queue = 0;   /* time based queue */
 fd_queue* g_fd_time_queue_last = 0;  /* add cache time based queue */
 struct timespec g_start_time;
 
+#ifdef __MACH__
+#include <mach/mach_time.h>
+#include <errno.h>
+
+typedef enum clockid
+{
+    CLOCK_REALTIME,
+    CLOCK_MONOTONIC,
+} clockid_t;
+
+int clock_gettime(clockid_t clk_id, struct timespec *tp)
+{
+    static mach_timebase_info_data_t timebase;
+    uint64_t t;
+    uint64_t ns;
+
+    if ( CLOCK_MONOTONIC != clk_id ) {
+        errno = -EINVAL;
+        return -1;
+    }
+
+    if ( timebase.denom == 0 ) {
+        (void) mach_timebase_info(&timebase);
+    }
+
+    t = mach_absolute_time();
+    ns = (t * timebase.numer) / timebase.denom;
+    tp->tv_sec = ns/(1000*1000*1000);
+    tp->tv_nsec = ns%(1000*1000*1000);
+
+    return 0;
+}
+#endif // __MACH__
+
 /* nsec difference between timespec */
 long long int usecDiff(struct timespec* time_stop, struct timespec* time_start)
 {
diff --git a/tools/tsororts/tsororts.c b/tools/tsororts/tsororts.c
index 1471d94..746fef7 100644
--- a/tools/tsororts/tsororts.c
+++ b/tools/tsororts/tsororts.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsorts/tsorts.c b/tools/tsorts/tsorts.c
index 5868c57..716bb73 100644
--- a/tools/tsorts/tsorts.c
+++ b/tools/tsorts/tsorts.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsoutputswitch/tsoutputswitch.c b/tools/tsoutputswitch/tsoutputswitch.c
index 606676d..b261dad 100644
--- a/tools/tsoutputswitch/tsoutputswitch.c
+++ b/tools/tsoutputswitch/tsoutputswitch.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsprinter/tsprinter.c b/tools/tsprinter/tsprinter.c
new file mode 100644
index 0000000..f4c7db7
--- /dev/null
+++ b/tools/tsprinter/tsprinter.c
@@ -0,0 +1,143 @@
+/*
+ * Copyright (C) 2010, Lorenzo Pallara l.pallara@avalpa.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
+ */
+
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <arpa/inet.h>
+#include <unistd.h>
+#include <time.h>
+
+#define TS_PACKET_SIZE 188
+#define BASEPORT 0x378 // lp1
+
+unsigned char control_bit0 = 0;
+unsigned char control_bit1 = 0;
+unsigned char control_bit2 = 0;
+unsigned char control_bit3 = 0;
+
+int main (int argc, char *argv[]) {
+
+ char* tsfile;
+ unsigned char write_buf[TS_PACKET_SIZE];
+ unsigned char control;
+ 
+ int transport_fd;
+ int len;
+ int i;
+ 
+ 
+ if(argc < 2 ) {
+   fprintf(stderr, "Usage: %s file.ts, need to be executed root\n", argv[0]);
+   fprintf(stderr, "WARNING: outputs a transport stream over a pc parallel port pins\n");
+   fprintf(stderr, "WARNING: cpu goes 100 percentage usage, ts packet jitter is high so use only for data and on dual core\n");
+   return 0;
+ } else {
+   tsfile = argv[1];
+ }
+ 
+ transport_fd = open(tsfile, O_RDONLY);
+ if(transport_fd < 0) {
+   fprintf(stderr, "can't open file %s\n", tsfile);
+   return 0;
+ }
+ 
+ int completed = 0;
+ 
+ if (ioperm(BASEPORT, 3, 1)) {
+   fprintf(stderr, "ioperm error\n");
+   close(transport_fd);
+   return 0;
+ }
+ while (!completed) {
+   len = read(transport_fd, write_buf, TS_PACKET_SIZE);
+   if(len < 0) {
+     fprintf(stderr, "ts file read error \n");
+     completed = 1;
+   } else if (len == 0) {
+     fprintf(stderr, "ts sent done\n");
+     completed = 1;
+   } else {
+     for (i = 0; i < TS_PACKET_SIZE; i++) {
+       
+       /*
+       BASEPORT is where data bits are:
+       */
+       outb(write_buf[i], BASEPORT); 
+       
+       /*
+       BASEPORT + 1 is read only, we don't care:
+       * Bit 0 is reserved
+       * Bit 1 is reserved
+       * Bit 2 IRQ status (not a pin, I don't know how this works)
+       * Bit 3 ERROR (1=high) aka nFault > XRESET
+       * Bit 4 SLCT (1=high) aka Select -> SDIN
+       * Bit 5 PE (1=high) aka Perror -> SCLK
+       * Bit 6 ACK (1=high) aka nAck -> SDOUT
+       * Bit 7 -BUSY (0=high) aka Busy -> ASCLK
+       */
+       
+       /*
+       BASEPORT + 2 is control and write-only (a read returns the data last written):
+       * Bit 0 -STROBE (0=high) aka nStrobe -> TS-CLK
+       * Bit 1 -AUTO_FD_XT (0=high) aka nAutoFd -> TS-SY
+       * Bit 2 INIT (1=high) aka nInit -> TS-VL
+       * Bit 3 -SLCT_IN (0=high) aka nSelectIn -> TS-EN
+       * Bit 4 enables the parallel port IRQ (which occurs on the low-to-high transition of ACK) when set to 1.
+       * Bit 5 controls the extended mode direction (0 = write, 1 = read), and is completely write-only (a read returns nothing useful for this bit).
+       * Bit 6 reserved
+       * Bit 7 reserved
+       */
+       
+       /* only on first byte: 0x47, the sync byte, it is necessary to set high TS-SY -> Bit 1 value is 0*/
+       if (i == 0) {
+         control_bit1 = 0;
+       } else {
+         control_bit1 = 1;
+       }
+       
+       /* valid signal is always high because every bit is correct as no real demodulation happens -> Bit 2 value is 1*/
+       control_bit2 = 1;
+       
+       /* enable signal is always high as every bit is data byte of the ts packet -> Bit 3 value is 0*/
+       control_bit3 = 0;
+       
+       /* bit 0 is clock -> high at data start -> Bit 0 value is 0*/
+       control_bit0 = 1;
+       control = control_bit0 | (control_bit1 << 1) | (control_bit2 << 2) | (control_bit3 << 3);
+       outb(control, BASEPORT + 2);
+       
+       /* bit 0 is clock -> low at half transmit time -> Bit 0 value is 1*/
+       control_bit0 = 0;
+       control = control_bit0 | (control_bit1 << 1) | (control_bit2 << 2) | (control_bit3 << 3);
+       outb(control, BASEPORT + 2);
+     }
+   }
+ }
+ close(transport_fd);
+ if (ioperm(BASEPORT, 3, 0)) {
+   fprintf(stderr, "ioperm error on exit\n");
+ }
+ return 0;
+}
diff --git a/tools/tstcpsend/Makefile b/tools/tstcpsend/Makefile
index 8894859..a066384 100644
--- a/tools/tstcpsend/Makefile
+++ b/tools/tstcpsend/Makefile
@@ -1,6 +1,6 @@
 C      = gcc
 CFLAGS  += -g -MD -Wall -I. -I../../include -D_FILE_OFFSET_BITS=64 $(CPPFLAGS)
-LDFLAGS  += -lc -lrt
+LFLAGS  = -lc
 
 OBJS = tstcpsend.o
 TARGET = tstcpsend
diff --git a/tools/tstcpsend/tstcpsend.c b/tools/tstcpsend/tstcpsend.c
index 8660355..07838e4 100644
--- a/tools/tstcpsend/tstcpsend.c
+++ b/tools/tstcpsend/tstcpsend.c
@@ -31,6 +31,40 @@
 
 #define TS_PACKET_SIZE 188
 
+#ifdef __MACH__
+#include <mach/mach_time.h>
+#include <errno.h>
+
+typedef enum clockid
+{
+    CLOCK_REALTIME,
+    CLOCK_MONOTONIC,
+} clockid_t;
+
+int clock_gettime(clockid_t clk_id, struct timespec *tp)
+{
+    static mach_timebase_info_data_t timebase;
+    uint64_t t;
+    uint64_t ns;
+
+    if ( CLOCK_MONOTONIC != clk_id ) {
+        errno = -EINVAL;
+        return -1;
+    }
+
+    if ( timebase.denom == 0 ) {
+        (void) mach_timebase_info(&timebase);
+    }
+
+    t = mach_absolute_time();
+    ns = (t * timebase.numer) / timebase.denom;
+    tp->tv_sec = ns/(1000*1000*1000);
+    tp->tv_nsec = ns%(1000*1000*1000);
+
+    return 0;
+}
+#endif // __MACH__
+
 long long int usecDiff(struct timespec* time_stop, struct timespec* time_start)
 {
  long long int temp = 0;
diff --git a/tools/tstimedwrite/Makefile b/tools/tstimedwrite/Makefile
index 3ad1432..21733ff 100644
--- a/tools/tstimedwrite/Makefile
+++ b/tools/tstimedwrite/Makefile
@@ -1,6 +1,6 @@
 C      = gcc
 CFLAGS  += -g -MD -Wall -I. -I../../include -D_FILE_OFFSET_BITS=64 $(CPPFLAGS)
-LDFLAGS  += -lc -lrt
+LFLAGS  = -lc
 
 OBJS = tstimedwrite.o
 TARGET = tstimedwrite
diff --git a/tools/tstimedwrite/tstimedwrite.c b/tools/tstimedwrite/tstimedwrite.c
index 3e51cc4..5ad0597 100644
--- a/tools/tstimedwrite/tstimedwrite.c
+++ b/tools/tstimedwrite/tstimedwrite.c
@@ -33,6 +33,40 @@
 
 #define TS_PACKET_SIZE 188
 
+#ifdef __MACH__
+#include <mach/mach_time.h>
+#include <errno.h>
+
+typedef enum clockid
+{
+    CLOCK_REALTIME,
+    CLOCK_MONOTONIC,
+} clockid_t;
+
+int clock_gettime(clockid_t clk_id, struct timespec *tp)
+{
+    static mach_timebase_info_data_t timebase;
+    uint64_t t;
+    uint64_t ns;
+
+    if ( CLOCK_MONOTONIC != clk_id ) {
+        errno = -EINVAL;
+        return -1;
+    }
+
+    if ( timebase.denom == 0 ) {
+        (void) mach_timebase_info(&timebase);
+    }
+
+    t = mach_absolute_time();
+    ns = (t * timebase.numer) / timebase.denom;
+    tp->tv_sec = ns/(1000*1000*1000);
+    tp->tv_nsec = ns%(1000*1000*1000);
+
+    return 0;
+}
+#endif // __MACH__
+
 long long int usecDiff(struct timespec* time_stop, struct timespec* time_start)
 {
  long long int temp = 0;
diff --git a/tools/tstimeout/tstimeout.c b/tools/tstimeout/tstimeout.c
index 17df5ec..de6ea08 100644
--- a/tools/tstimeout/tstimeout.c
+++ b/tools/tstimeout/tstimeout.c
@@ -33,7 +33,6 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <linux/fb.h>
 #include <sys/mman.h>
 #include <fcntl.h>
 #include <sys/socket.h>
diff --git a/tools/tsudpsend/Makefile b/tools/tsudpsend/Makefile
index 0d55bd4..b398ec4 100644
--- a/tools/tsudpsend/Makefile
+++ b/tools/tsudpsend/Makefile
@@ -1,6 +1,6 @@
 C      = gcc
 CFLAGS  += -g -MD -Wall -I. -I../../include -D_FILE_OFFSET_BITS=64 $(CPPFLAGS)
-LDFLAGS  += -lc -lrt
+LFLAGS  = -lc
 
 OBJS = tsudpsend.o
 TARGET = tsudpsend
diff --git a/tools/tsudpsend/tsudpsend.c b/tools/tsudpsend/tsudpsend.c
index 496588d..9cccc94 100644
--- a/tools/tsudpsend/tsudpsend.c
+++ b/tools/tsudpsend/tsudpsend.c
@@ -33,6 +33,40 @@
 
 #define TS_PACKET_SIZE 188
 
+#ifdef __MACH__
+#include <mach/mach_time.h>
+#include <errno.h>
+
+typedef enum clockid
+{
+    CLOCK_REALTIME,
+    CLOCK_MONOTONIC,
+} clockid_t;
+
+int clock_gettime(clockid_t clk_id, struct timespec *tp)
+{
+    static mach_timebase_info_data_t timebase;
+    uint64_t t;
+    uint64_t ns;
+
+    if ( CLOCK_MONOTONIC != clk_id ) {
+        errno = -EINVAL;
+        return -1;
+    }
+
+    if ( timebase.denom == 0 ) {
+        (void) mach_timebase_info(&timebase);
+    }
+
+    t = mach_absolute_time();
+    ns = (t * timebase.numer) / timebase.denom;
+    tp->tv_sec = ns/(1000*1000*1000);
+    tp->tv_nsec = ns%(1000*1000*1000);
+
+    return 0;
+}
+#endif // __MACH__
+
 long long int usecDiff(struct timespec* time_stop, struct timespec* time_start)
 {
  long long int temp = 0;
diff --git a/tools/txt2pes/Makefile b/tools/txt2pes/Makefile
index f506da7..a32543d 100644
--- a/tools/txt2pes/Makefile
+++ b/tools/txt2pes/Makefile
@@ -4,7 +4,7 @@ LDFLAGS  += -lc
 
 OBJS = txt2pes.o
 TARGET = txt2pes
-DESTDIR = /usr/local/bin/
+DESTDIR ?= /usr/local/bin/
 
 all: $(TARGET)
 
diff --git a/tools/txt2pes/txt2pes.c b/tools/txt2pes/txt2pes.c
index fd87109..23afabc 100644
--- a/tools/txt2pes/txt2pes.c
+++ b/tools/txt2pes/txt2pes.c
@@ -19,10 +19,7 @@
 #define _BSD_SOURCE 1
 
 #include <stdio.h> 
-#include <stdio_ext.h> 
 #include <unistd.h> 
-#include <netinet/ether.h>
-#include <netinet/in.h>
 #include <stdio.h>
 #include <fcntl.h>
 #include <string.h>
diff -ur opencaster-orig/libs/dvbobjects/Makefile opencaster-3.2.1/libs/dvbobjects/Makefile
--- opencaster-orig/libs/dvbobjects/Makefile	2013-09-12 14:01:50.000000000 +0200
+++ opencaster-3.2.1/libs/dvbobjects/Makefile	2013-11-06 15:35:03.000000000 +0100
@@ -6,7 +6,7 @@
 	./setup.py build
 
 install: all
-	./setup.py install --root=$(INSTHOME)
+	python ./setup.py install --root=$(INSTHOME)
 #install: all
 #	./setup.py install 
 
diff -ur opencaster-orig/tools/Makefile opencaster-3.2.1/tools/Makefile
--- opencaster-orig/tools/Makefile	2013-09-23 13:59:53.000000000 +0200
+++ opencaster-3.2.1/tools/Makefile	2013-11-06 15:35:31.000000000 +0100
@@ -3,7 +3,7 @@
 	tspcrmeasure tspidmapper esaudio2pes esaudioinfo \
 	esvideompeg2pes esvideompeg2info pes2es pesaudio2ts \
 	pesvideo2ts pesinfo tsstamp \
-	ts2pes mpe2sec tscbrmuxer mpeg2videovbv tstdt i13942ts \
+	ts2pes tscbrmuxer mpeg2videovbv tstdt i13942ts \
 	tsvbr2cbr tsfixcc tsudpreceive tsudpsend dsmcc-receive \
 	tspcrstamp tstcpreceive tstcpsend tstimeout \
 	tstimedwrite tsinputswitch tsdoubleoutput pes2txt \
