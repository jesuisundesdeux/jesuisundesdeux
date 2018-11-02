#!/bin/sh

wget http://data.montpellier3m.fr/sites/default/files/ressources/TAM_MMM_VELOMAG.xml -O /tmp/velomag.xml

mkdir -p public/datas/velomag/
xsltproc datas/velomag/velomag.xslt /tmp/velomag.xml > public/datas/velomag/velomag.csv 