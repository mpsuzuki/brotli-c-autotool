AUTOMAKE_OPTIONS = foreign nostdinc subdir-objects

ACLOCAL_AMFLAGS = -I m4

LIBBROTLI_VERSION_INFO = -version-info @AC_BROTLI_ABI_CURRENT@:@AC_BROTLI_ABI_REVISION@:@AC_BROTLI_ABI_AGE@

SUBDIRS = common dec enc tools

include headers.lst
include_HEADERS = $(bootstrap_headers)
