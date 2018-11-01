#!/bin/bash

# https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/
# Licence ODbl
# wget https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354
cat caracteristiques-2017.csv|strings | grep -v ",," > caracteristiques-2017-ascii.csv
q -H -d"," -O "select lat/100000.0 as lat,long/100000.0 as long,count(*) as count from ./caracteristiques-2017-ascii.csv where dep=340 group by long,lat" > caracteristiques-2017-converted.csv