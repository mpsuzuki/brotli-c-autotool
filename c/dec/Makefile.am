lib_LTLIBRARIES = libbrotlidec.la
libbrotlidec_la_LIBTOOLFLAGS = @LIBBROTLI_VERSION_INFO@
libbrotlidec_la_SOURCES = \
	bit_reader.c decode.c huffman.c state.c \
	bit_reader.h huffman.h prefix.h state.h

AM_CFLAGS = -I$(top_srcdir)/include
