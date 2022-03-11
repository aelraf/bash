#!/bin/bash
# skrypt usuwa wszsytkie podkatalogi pierwszego parametru wywołania, ich zawartość jest przenoszona do katalogu nadrzędnego
# usuwanie dotyczy tylko jednego poziomu podkatalogów

if [ $# -ne 1 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Użycie: $0 katalog"
	exit 1
fi

if [[ ! -d $1 ]] 
then 
	echo "$1 nie jest katalogiem!"
	exit 1
fi

WYKAZ=`ls $1`

for plik in $WYKAZ
do
	if [[ -d $plik ]]
	then
		mv $1/$plik/* $1
		rmdir $1/$plik
	fi 
done
