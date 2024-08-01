AUTOMAKE_OPTIONS = foreign nostdinc subdir-objects

ACLOCAL_AMFLAGS = -I m4

LIBBROTLI_VERSION_INFO = -version-info @LIBBROTLI_ABI_VERSION_MAJOR@:@LIBBROTLI_ABI_VERSION_MINOR@:@LIBBROTLI_ABI_VERSION_PATCH@

SUBDIRS = common dec enc tools

include_HEADERS = \
	$(top_srcdir)/include/brotli/decode.h \
	$(top_srcdir)/include/brotli/encode.h \
	$(top_srcdir)/include/brotli/port.h \
	$(top_srcdir)/include/brotli/shared_dictionary.h \
	$(top_srcdir)/include/brotli/types.h
