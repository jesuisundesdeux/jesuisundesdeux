#!/bin/bash

# https://www.data.gouv.fr/fr/datasets/base-de-donnees-des-accidents-corporels-de-la-circulation/#_
# License ODbl
# wget https://www.data.gouv.fr/fr/datasets/r/6aad6dbd-5da0-4815-8e68-39e950cec49e
q -H -d";" -O "select lat/100000.0 as lat, long/100000.0 as long, grav, ttue, tbg, tbl ,ttue+tbg+tbl as nbimp from ./accidents_insee.csv where dep=340 and (lat>0 and long>0)" > accidents_insee-converted.csv
