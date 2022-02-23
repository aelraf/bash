#!/bin/bash

repeta="tak"
until [ $repeta = "nie" ]
do
df -h
echo "Czy wyswietlic ponownie statystyki?"
read repeat
done