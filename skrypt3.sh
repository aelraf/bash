#!/bin/bash

# sprawdzamy, czy użytkownik o podanej nazwie istnieje

echo "Podaj nazwę użytkownika:"
read user 

checking = $(cat /etc/passwd | grep $user || echo "nie ma takiego użytkownika")

echo "Czy jesteś pewien, że chcesz dokonać sprawdzenia (T/N)?"
read imsure

case $imsure in
# powodzenie operacji
t) echo $checking ;;
T) echo $checking ;;
# niepowodzenie operacji
n) echo "Konczymy dzialalnosc." ;;
N) echo "Konczymy dzialalnosc" ;;

*) echo "Niewlasciwa wartosc - skrypt konczy dzialanie" ;;

esac
