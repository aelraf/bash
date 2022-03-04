#!/bin/bash
# skrypt usuwa wszystkie pliki o zerowej wartości (puste) z katalogu zadanym jako parametr wywołania.
# tworzy w zadanym pliku listę nazw skasowanych plików
#
# nie analizuje linków symbolicznych

if [ $# -ne 2 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Użycie: $0 katalog plik_wynikowy"
	exit 1
fi 

if [ ! -d $1 ]
then 
	echo "$1 nie jest katalogiem!"
	exit 1 
fi

biezacy_katalog=`pwd`
cd $1
for plik in *
do
	if [[ ! -s $plik ]] && [[ -f $plik ]] && [[ ! -L $plik ]]
	then
		echo "Usunąłem plik $plik." >> $biezacy_katalog/$2
		rm $plik -f 
	fi 
done

cd $biezacy_katalog
