#!/bin/bash
# skrypt laczy w jeden wszystkie pliki nalezace do zadanego katalogu (pierwszy parametr wywolania) o podanym jako drugi parametr rozszerzeniu.
# kolejnosc laczenia jest nieistotna
# tresc kazdego pliku poprzedzona jest naglowkiem z jego nazwa
# 
if [ $# -ne 2 ]
then
	echo "Niepoprawna liczba argumentow."
	echo "Uzycie: $0 katalog rozszerzenie"
	exit 1
fi

if [ -d $1 ]
then
	biezacy_katalog=`pwd`
	cd $1
	for plik in *.$2
	do
		if [ -d $plik ]
		then 
			continue
		else 
			echo "Plik $plik:" >> $2
			cat $plik >> $2
		fi 
	done
	cd $biezacy_katalog
else 
	echo "$1 nie jest katalogiem!"
	exit 1
fi 
