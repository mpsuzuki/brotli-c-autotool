AC_PREREQ(2.57)

dnl Actual version is substituted by bootstrap
AC_INIT([brotli], [1.0.9], [https://groups.google.com/forum/#!forum/brotli])

AM_INIT_AUTOMAKE()
AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CC
LT_INIT

AC_BROTLI_ABI_CURRENT=@bootstrap_brotli_abi_current@
AC_BROTLI_ABI_REVISION=@bootstrap_brotli_abi_revision@
AC_BROTLI_ABI_AGE=@boostrap_brotli_abi_age@

AC_SUBST([AC_BROTLI_ABI_CURRENT])
AC_SUBST([AC_BROTLI_ABI_REVISION])
AC_SUBST([AC_BROTLI_ABI_AGE])

AC_SUBST([LIBBROTLI_VERSION_INFO])

LIBMATH_LOG2=
AC_CHECK_FUNCS([log2],[
  AC_DEFINE([HAVE_LOG2])
],[
  AC_SEARCH_LIBS([log2], [m math sunmath], [AC_DEFINE([HAVE_LOG2])])
])

AC_CONFIG_HEADERS([common/config.h])
AC_CONFIG_FILES([Makefile common/Makefile dec/Makefile enc/Makefile tools/Makefile])

AC_OUTPUT
