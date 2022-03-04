#!/bin/bash
# skrypt pokazuje pliki z katalogu zadanego jako parametr wywołania skryptu, wraz z jego podkatalogami.
# zawartość jest listowana w postaci:
# ścieżka_dostępu_względem_listowanego_katalogu/nazwa_pliku
#
# liczba zagnieżdżeń podkatalogów ograniczana jest przez zmienną GLEBOKOSC

GLEBOKOSC=3
if [ $# -ne 1 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Użycie: $0 katalog"
	exit 1
fi

if [ ! -d $1 ]
then 
	echo "$1 nie jest katalogiem! "
	exit 1
fi

function pokaz_zawartosc_kat
{
	ZAWARTOSC=`ls $1`
	for plik in $ZAWARTOSC
	do
		if [-d $1/$plik ]
		then
			if [[ $GLEBOKOSC -gt 0 ]]
			then 
				let GLEBOKOSC=GLEBOKOSC-1
				echo "$1/$plik"
				pokaz_zawartosc_kat $1/$plik
				let GLEBOKOSC=GLEBOKOSC+1
			fi
		else
			echo "$1/$plik"
		fi 
	done
}

pokaz_zawartosc_kat $1
