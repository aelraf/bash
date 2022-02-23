#!/bin/bash

# kopiujemy drzewo katalogow przy uzyciu cpio

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
  echo "Uzycie: `basename $0` zrodlo miejsce_docelowe"
  exit $E_BADARGS
fi  

source=$1
destination=$2

find "$source" -depth | cpio -admvp "$destination"
# w razie potrzeby doczytac opcje cpio 

exit 0
