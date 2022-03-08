#!/bin/bash
# porównuje zawartość katalogu z listą plików, oba podane jako argumenty wywołania
# zwraca listę plików brakujących w katalogu i nieobecnych na liście

if [ $# -ne 2 ]
then
	echo "Niepoprawna liczba argumentów."
	echo "Użycie: $0 katalog_źródłowy plik_z_listą"
	exit 1
fi

if [[ ! -d $1 ]]
then
	echo "$1 nie jest katalogiem!"
	exit 1
fi 

if [[ ! -f $2 ]]
then
	echo "Nie ma pliku $2!"
	exit 1
fi 

WYKAZ1=`ls$1`
WYKAZ2=`cat $2`

echo "Pliki z listy, których nie ma w katalogu:"
for plik1 in $WYKAZ2
do
	ZNALEZIONO=0
	for plik2 in $WYKAZ1
	do 
		if [[ $plik1 = $plik2 ]]
		then
			ZNALEZIONO=1
		fi 
	done 
	if [[ ZNALEZIONO -eq 0 ]]
	then
		echo $plik1 
	fi 
done

echo "Pliki z katalogu, których nie ma na liście: "
for plik1 in $WYKAZ1
do 
	ZNALEZIONO=0
	for plik2 in $WYKAZ2
	do 
		if [[ $plik1 = $plik2 ]]
		then
			ZNALEZIONO=1
		fi 
	done 
	if [[ ZNALEZIONO -eq 0 ]]
	then
		echo $plik1 
	fi 
done 
