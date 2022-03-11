#!/bin/bash
# skrypt wysyła pocztę elektroniczną do wszystkich użytkowników systemu
# treść jest zadana zawartością pliku, będącego parametrem wywołania skryptu 
# lista lokalnnych użytkowników jest uzyskiwana w najprostrzy sposób - przez listowanie /var/spool/mail

if [ $# -ne 1 ]
then 
	echo "Niepoprawna liczba argumentów."
	echo "Użycie: $0 plik_z_wiadomoscia"
	exit 1
fi

if [[ ! -e $1 ]]
then 
	echo "Nie ma pliku $1"
	exit 1
fi

WYKAZ=`ls /var/spool/mail`

for adresat in $WYKAZ
do 
	cat $1 | mail
done
