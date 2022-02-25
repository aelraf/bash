#!/bin/bash
# numeruje wszystkie pliki w katalogu podanym jako parametr wywolania, do ktorych mamy prawo wykonywania, dodajac na koncu .kolejny_numer 
#
if [ $# -ne 1 ]
then
	echo "Niepoprawna ilosc argumentow."
	echo "Uzycie: $0 katalog"
	exit 1
fi

if [ -d $1 ]
then
	biezacy_katalog=`pwd`
	cd $1
	licznik=1
	zawartosc=`ls -S -r`
	for plik in $zawartosc
	do
		if [ -d $plik ]
		then
			continue
		else
			mv $plik $plik.$licznik
			let licznik=licznik+1
		fi 
	done
	cd $biezacy_katalog
else
	echo "$1 nie jest katalogiem!"
	exit 1
fi
