#!/bin/bash

# wyświetli stan pamięci operacyjnej 

echo "w jakich jednostkach chcesz zobaczyć stan pamięci operacyjnej? "
echo "k - kilobajty"
echo "m - megabajty"
echo "g - gigabajty"

read parametr

free -$parametr 
