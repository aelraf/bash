#!/bin/bash
# skrypt porównuje zawartość dwóch katalogów zadanych jako parametry wywołania, ignorując podkatalogi.
# jako wynik wypisuje na ekranie listę plików identycznych w obu katalogach

if [ $# -ne 2 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Uzycie: $0 katalog_źródłowy katalog_docelowy"
	exit 1
fi 

if [[ ! -d $1 ]]
then
	echo "$1 nie jest katalogiem!"
	exit 1
fi

if [[ ! -d $2 ]]
then
	echo "$2 nie jest katalogiem!"
	exit 1
fi

WYKAZ1=`ls $1`
WYKAZ2=`ls $2`

for plik1 in $WYKAZ1
do
	for plik2 in $WYKAZ2
	do
		if [[ ! -d $1/$plik1 ]] && [[ ! -d $2/$plik2 ]]
		then
			diff $1/$plik1 $2/$plik2 > /dev/null
			if [[ $? -eq 0 ]] && [[ $plik1 = $plik2 ]]
			then
				echo "Plik $plik1 jest taki sam w obu katalogach."
			fi 
		fi 
	done 
done
