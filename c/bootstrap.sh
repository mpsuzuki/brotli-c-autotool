#!/bin/sh

# -------------------------
# GENERATE source.lst FILES
# -------------------------
# To catch up the upstream easily, we do not want to hardwire
# the source file names in Makefile.am. Refer source.lst in
# each subdirectories.

for d in common dec enc tools
do
  echo -n "* Generating "${d}"/source.lst..."
  (cd ${d} && \
   echo "bootstrap_sources=\\" > source.lst && \
   ls -1 *.c *.h 2>/dev/null | sed '/^config\.h$/d;s/^/	/;s/$/ \\/' | sed '$s/\\$//' >> source.lst )
  echo    " ok"
done


# The list of header files to install should not be maintained
# manually (see above)

echo -n "* Generating headers.lst..."
echo "bootstrap_headers=\\" > headers.lst
find include/ -name "*.h" | sed 's/^/	/;s/$/ \\/' | sed '$s/\\$//' >> headers.lst
echo    " ok"





# ------------------------------------------
# EXTRACT VERSION INFO FROM common/version.h
# ------------------------------------------
# To extract the version info from common/version.mk,
# unfortunately there is no straight Autoconf macro.
# This is ugly workaround. Should we use sed or awk
# to extract "#define BROTLI_VERSION_XXX YYY" ?

echo -n "* Generating brotli-version.mk..."
tmp_c=`mktemp "brotli-version-XXXXX.c"`
cat >> ${tmp_c} <<EOF
bootstrap_brotli_version_major=BROTLI_VERSION_MAJOR
bootstrap_brotli_version_minor=BROTLI_VERSION_MINOR
bootstrap_brotli_version_patch=BROTLI_VERSION_PATCH

bootstrap_brotli_abi_current=BROTLI_ABI_CURRENT
bootstrap_brotli_abi_revision=BROTLI_ABI_REVISION
bootstrap_brotli_abi_age=BROTLI_ABI_AGE
EOF
cc -E -include common/version.h ${tmp_c} | sed "/^#/d" > brotli-version.mk
rm -f ${tmp_c}
echo    " ok"

# Dig m4 directory to store brotli-version.m4

if test ! -r m4
then
  echo -n "* mkdir m4..."
  mkdir m4
  echo    " ok"
fi

echo -n "* Generating m4/brotli-version.m4..."
tmp_c=`mktemp "brotli-version-XXXXX.c"`
cat >> ${tmp_c} <<EOF
AC_DEFUN([AC_BROTLI_SET_VERSIONS],[
  \$1=BROTLI_VERSION_MAJOR
  \$2=BROTLI_VERSION_MINOR
  \$3=BROTLI_VERSION_PATCH
])
AC_DEFUN([AC_BROTLI_SET_ABI_NUMBERS],[
  \$1=BROTLI_ABI_CURRENT
  \$2=BROTLI_ABI_REVISION
  \$3=BROTLI_ABI_AGE
])
EOF
cc -E -include common/version.h ${tmp_c} | sed "/^#/d" > m4/brotli-version.m4
rm -f ${tmp_c}
echo    " ok"

echo -n "* Generating VERSION..."
tmp_c=`mktemp "brotli-version-XXXXX.c"`
cat >> ${tmp_c} <<EOF
BROTLI_VERSION_MAJOR.BROTLI_VERSION_MINOR.BROTLI_VERSION_PATCH
EOF
cc -E -include common/version.h ${tmp_c} | sed "/^#/d;s/ //g" > VERSION
rm -f ${tmp_c}
echo    " ok"



# ---------
# AUTOTOOLS
# ---------
# Finally we generate configure!

echo "* libtoolize -f -c -i"
libtoolize -f -c -i
echo "* aclocal"
aclocal -I m4
echo "* autoheader"
autoheader
echo "* automake -a -f -c -i"
automake -a -f -c -i
echo "* autoconf"
autoconf
