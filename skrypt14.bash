#!/bin/bash
# skrypt łączy w jeden pliki z listy umieszczonej w pliku o nazwie, będącej parametrem wywołania. 
# pliki są łączone w kolejności wg miejsca na liście.
# treść każdego pliku poprzedzona jest nagłówkiem z jego nazwą
# plik wynikowy ma nazwę pliku pierwotnie zawierającego listę

if [ $# -ne 1 ]
then
    echo "Niepoprawna liczba argumentów."
	echo "Uzycie: $0 plik_z_lista"
	exit 1
fi

if [ ! -f $1 ]
then
    echo "nie ma pliku $1!"
	exit 1
fi 

ZAWARTOSC=`cat $1`
rm $1 -f
for plik in $ZAWARTOSC
do
    if [[ -f $plik ]]
	then
	    echo "Plik $plik:" >> $1
		cat $plik >> $1
	fi 
done
