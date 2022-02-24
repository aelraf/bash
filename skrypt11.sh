#!/bin/bash

# skrypt jako parametr przyjmuje nazwe katalogu, w ktorym usunie wszystkie pliki poza wykonalnymi 
# (czyli mającymi ustawiony bit execute)

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS"]
then
  echo "Uzycie: `basename $0` katalog plik_z_lista"
  exit $E_BADARGS
fi

if [ -d $1 ]
then 
  biezacy_katalog=`pwd`
  cd $1
  for plik in *
  do
    if [ -x $plik ]
	then
	  continue
	else 
	  rm $plik -f
	fi 
  done
  cd $biezacy_katalog
else 
  echo "$1 nie jest katalogiem!"
  exit 1
fi 
