### Cyclistes Montpelliérains à Montpellier

#### Trajets les plus fréquents

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier.png" width="50%" >

#### Zones de croisements

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier_carrefour.png" width="50%" >


#### Ensembles des trajets

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier_all.png" width="50%" >

### Cyclistes Montpelliérains en France

#### Ensembles des trajets

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_france_all.png" width="50%" >

### Les cyclistes Montpelliérains

[Adelé Bruno](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/bruno.adele/README.md)

[Dassonville Charles](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/charles.dassonville/README.md)

[Tyson Aurelien](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/aurelien.tyson/README.md)

### Generated with strava-local-heatmap
```
# File converted with strava-to-file 
# cd username_strava_folder
# python convert.py -d ~/private/projects/jesuisundesdeux/datas/traces -u $(basename $(pwd))
# ./tool_reduce_gpx_size.sh
# python jesuisundesdeux_summarize.py -d ~/private/projects/jesuisundesdeux/datas/traces/ -u $(basename $(pwd))

MAXNBTITLES=12

# France
BOUNDS=(49.382373 -5.328369 42.867912 11.90918)
#python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces -f "**/*_reduced_trace.gpx" -m #$MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france.png -d #~/private/projects/jesuisundesdeux/datas/traces/heatmap_france.csv

python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces -f "**/*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france_all.png -d ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france_all. -a false


# Montpellier
BOUNDS=(43.629366 3.835258 43.576101 3.97533)
python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces -f "**/*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier.png -d ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier.csv

python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces -f "**/*_junction_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_carrefour.png -d ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_carrefour.csv


python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces -f "**/*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_all.png -d ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_all.csv -a false

TRACEUSERS=(aurelien.tyson bruno.adele charles.dassonville)
for TRACEUSER in $TRACEUSERS; do
    # France
    BOUNDS=(49.382373 -5.328369 42.867912 11.90918)
    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_france.png -d ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_france.csv

    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_france_all.png -d ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_france_all.csv -a false

    # Montpellier
    BOUNDS=(43.629366 3.835258 43.576101 3.97533)
    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier.png -d ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier.csv

    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_junction_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier_carrefour.png -d ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier_carrefour.csv


    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_reduced_trace.gpx" -m $MAXNBTITLES -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier_all.png -d ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_${TRACEUSER}_montpellier_all.csv -a false
done
```