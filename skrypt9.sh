#!/bin/bash

# skrypt zmienia nazwy wszystkich plikow w katalogu podanym jako parametr, do ktorych posiadamy prawo zapisu, 
# przez dodanie dodatkowego czlonu .old
# wczesniej kasuje wszystkie pliki, ktore juz maja takie rozszerzenie

if [ $# -ne "$ARGS" ]
then
  echo "Uzycie: `basename $0` zrodlo miejsce_docelowe"
  exit $E_BADARGS
fi

rm *.old -f 
for nazwa in *
do
  if [ -w $nazwa ]
  then
    mv $nazwa $nazwa.old 
  fi
done  
