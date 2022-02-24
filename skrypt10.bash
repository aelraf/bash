#!/bin/bash

# skrypt jako parametr przyjmuje nazwe katalogu, w ktorym utworzy nowe pliki, wg listy umieszczonej w drugim parametrze wywolania
# nowe pliki maja pusta zawartosc,
# jesli ktorys plik z listy juz istnieje, to nie jest niszczony

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS"]
then
  echo "Uzycie: `basename $0` katalog plik_z_lista"
  exit $E_BADARGS
fi 

if [ -d $1 ]
then 
  if [ -f $2 ]
  then 
    pliki=`cat $2`
  else   
    echo "Nie ma pliku $2!"
	exit 1
  fi
else 
  echo "$1 nie jest katalogiem!"
  exit 1
fi 

for plik in $pliki
do
  if [ ! -e $plik ]
  then
    touch $1/$plik  
  fi 
done  