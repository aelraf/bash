#!/bin/bash

# w petli wypytuje o jednostki zwracanego stanu pamieci operacyjnej

powtorka="tak"
while [ $powtorka = "tak" ]
do

echo -e "W jakich jednostkach chcesz zobaczyc stan pamieci operacyjnej? \n m - megabajty, \n g - gigabajty, \n k - kilobajty ?"
read parametr

free -$parametr

echo "czy wykonac skrypt ponownie?"
read powtorka
done
