#!/bin/bash
# rozpakowanie archiwum "rpm"
# $$ to ID procesu skryptu
# konwertujemy archiwum rpm do archiwum cpio 
# rozpakowujemy archiwum cpio
# usuwamy archiwum cpio 

E_NO_ARGS=65
TEMPFILE=$$.cpio

if [ -z "$1" ]
then
  echo "uzycie: `basename $0` nazwa_pliku"
exit $E_NO_ARGS
fi

rpm2cpio < $1 > $TEMPFILE  
cpio --make-directories -F $TEMPFILE -i 
rm -f $TEMPFILE 

exit 0