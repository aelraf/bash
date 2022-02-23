#!/bin/bash

# skrypt z parametrami - sprawda, czy w katalogu domowym istnieje okreslony folder

if [ "$#" -eq 0 ] ; then
echo ""
exit 0

elif [ -d -/$1 ] ; then 
echo "Istnieje katalog o nazwie $1 w katalogu domowym"
else
echo "W katalogu domowym brak katalogu $1"
fi
