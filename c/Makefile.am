AUTOMAKE_OPTIONS = foreign nostdinc subdir-objects

ACLOCAL_AMFLAGS = -I m4

LIBBROTLI_VERSION_INFO = -version-info @LIBBROTLI_ABI_VERSION_MAJOR@:@LIBBROTLI_ABI_VERSION_MINOR@:@LIBBROTLI_ABI_VERSION_PATCH@

SUBDIRS = common dec enc tools

include headers.lst
include_HEADERS = $(bootstrap_headers)
