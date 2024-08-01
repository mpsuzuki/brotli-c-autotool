lib_LTLIBRARIES = libbrotlicommon.la
libbrotlicommon_la_LIBTOOLFLAGS = @LIBBROTLI_VERSION_INFO@
libbrotlicommon_la_SOURCES = \
	constants.c context.c dictionary.c platform.c \
	shared_dictionary.c transform.c \
	\
	constants.h context.h dictionary.h platform.h \
	shared_dictionary_internal.h transform.h \
	version.h

AM_CFLAGS = -I$(top_srcdir)/include
