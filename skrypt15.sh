#!/bin/bash
# skrypt przenosi pliki z prawem wykonywania z katalogów źródłowego do docelowego, których nazwy są podane jako parametry wywołania
# pozostałe pliki zostają bez zmian

if [ $# -ne 2 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Uzycie: $0 katalog_zrodlowy katalog_docelowy"
	exit 1
fi

if [[ -d $1 ]] && [[ -d $2 ]]
then
	biezacy_katalog=`pwd`
	cd $1
	for plik in *
	do
		if [ -d $plik ]
		then
			continue
		else
			if [ -x $plik ]
			then
				mv $plik $biezacy_katalog/$2
			fi 
		fi 
	done
	cd $biezacy_katalog
else 
	echo "$1 lub $2 nie jest katalogiem!"
	exit 1
fi
