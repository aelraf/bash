#!/bin/bash

repeta="tak"
while [ $repeta = "tak" ]
do
df -h
echo "Czy wyswietlic ponownie statystyki?"
read repeat
done