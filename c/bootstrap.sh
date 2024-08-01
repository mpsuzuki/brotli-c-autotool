#!/bin/sh

for d in common dec enc tools
do
  echo -n "* Generating "${d}"/source.lst..."
  (cd ${d} && \
   echo "bootstrap_sources=\\" > source.lst && \
   ls -1 *.c *.h 2>/dev/null | sed 's/^/	/;s/$/ \\/' | sed '$s/\\$//' >> source.lst )
  echo    "ok"
done

if test ! -r m4
then
  echo -n "* mkdir m4..."
  mkdir m4
  echo    "ok"
fi

echo "* aclocal"
aclocal
echo "* autoheader"
autoheader
echo "* libtoolize -f -c -i "
libtoolize -f -c -i
echo "* automake -a -f -c -i"
automake -a -f -c -i
echo "* autoconf"
autoconf
