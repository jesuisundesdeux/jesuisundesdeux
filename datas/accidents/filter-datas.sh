#!/bin/bash

# Download all files from https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/

if [ -z $1 ]; then
	echo "Please define departement you want filter"
	exit 1
fi

deplen=${#1}
DEP=$1
if [ $deplen -eq 2 ]; then
	DEP=$DEP0
fi

echo "Prepare datas for $1 departement ..."

if [ ! -f caracteristiques_all_dates.csv ]; then
	cp caracteristiques-2017.csv caracteristiques_2017.csv
	cat caracteristiques_20* >caracteristiques_all_dates.csv
fi

if [ ! -f usagers_2017.csv ]; then
	cp usagers-2017.csv usagers_2017.csv
	cat usagers_20* >usagers.csv
fi

echo "Remove encoding bad characters"
test -f caracteristiques.csv ||	cat caracteristiques_all_dates.csv | strings >caracteristiques.csv


echo "Summarize datas ..."
test -f accidents.csv || q -H -d"," -O 'SELECT c.Num_Acc,c.an,c.mois,c.jour,c.dep,c.lat/100000.0 as lat, c.long/100000.0 as long,sum(grav=1) as indemne,sum(grav=4) as blesse,sum(grav=3) as hospitalise,sum(grav=2) as decede,sum(grav=1) + sum(grav=2) + sum(grav=3) + sum(grav=4) as total FROM ./caracteristiques.csv c LEFT JOIN usagers.csv u ON (c.Num_Acc = u.Num_Acc) WHERE (lat>0 and long>0) GROUP BY c.Num_Acc,c.an,c.mois,c.jour,c.dep,c.lat/100000.0, c.long/100000.0'>accidents.csv

echo "Filtering datas"
test -f accidents_34.csv || q -H -d"," -O "SELECT * FROM ./accidents.csv WHERE dep=340" >accidents_$1.csv
