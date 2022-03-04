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

