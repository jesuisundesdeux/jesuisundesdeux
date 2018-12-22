### Cyclistes Montpelliérains à Montpellier

Les graphes ci-dessous sont générés grâce aux dons des traces par les cyclistes ci-dessous.

[Adelé Bruno](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/bruno.adele/README.md) | [Dassonville Charles](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/charles.dassonville/README.md) | [Favre Brice](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/brice.favre/README.md) | [Tyson Aurelien](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/aurelien.tyson/README.md)


#### Trajets les plus fréquents

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier.png" width="50%" >

#### Zones de croisements

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier_carrefour.png" width="50%" >


#### Ensembles des trajets

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_montpellier_all.png" width="50%" >

### Cyclistes Montpelliérains en France

#### Ensembles des trajets

<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_france_all.png" width="50%" >

## Preprare datas
```
# File converted with strava-to-file 
# cd username_strava_folder
# python strava-to-file/convert.py -d ~/private/projects/jesuisundesdeux/datas/traces -u $(basename $(pwd))
# cd jesuisundesdeux/datas/traces/
# ./tool_reduce_gpx_size.sh
# cd username_strava_folder
# python strava-to-file/jesuisundesdeux_summarize.py -d ~/private/projects/jesuisundesdeux/datas/traces/ -u $(basename $(pwd))
```

### Generate heatmap with strava-local-heatmap
```
#cd strava-local-heatmap 
MAXNBTITLES=12

# France
BOUNDS=(49.382373 -5.328369 42.867912 11.90918)
#python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles #$MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france.png --csv-output 

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france_all.png --csv-output --no-cdist


# Montpellier
BOUNDS=(43.629366 3.835258 43.576101 3.97533)
python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier.png --csv-output

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_carrefour.png --csv-output


python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_all.png --csv-output --no-cdist

TRACEUSERS=(aurelien.tyson bruno.adele charles.dassonville brice.favre eric.erack vincent-xavier.jumel)
for TRACEUSER in $TRACEUSERS; do
    # France
    BOUNDS=(49.382373 -5.328369 42.867912 11.90918)
    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france_all.png --csv-output --no-cdist

    # Montpellier
    BOUNDS=(43.629366 3.835258 43.576101 3.97533)
    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_carrefour.png --csv-output


    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDS --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_all.png --csv-output --no-cdist
done
```