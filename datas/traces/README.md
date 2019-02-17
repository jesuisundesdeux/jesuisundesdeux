### Cyclistes Montpelliérains à Montpellier

Les graphes ci-dessous sont générés grâce aux dons des traces par les cyclistes ci-dessous.

{{AUTHORS}}

[Adelé Bruno](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/bruno.adele/README.md) | [Blanchard Erick](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/erick.blanchard/README.md) | [Bob Seb](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/seb.bob/README.md) | [Bonnal Aurelien](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/aurelien.bonnal/README.md) | [Brousse Cédric](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/cedric.brousse/README.md) | [Dassonville Charles](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/charles.dassonville/README.md) | [Erack Eric](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/eric.erack/README.md) | [Favre Brice](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/brice.favre/README.md) | [Girard Thomas](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/thomas.girard/README.md) | [Tyson Aurelien](https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/blob/master/datas/traces/aurelien.tyson/README.md)


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
# source strava-to-file/.virtualenv/bin/activate
# python strava-to-file/convert.py -d ~/private/projects/jesuisundesdeux/datas/traces -u $(basename $(pwd))
# cd jesuisundesdeux/datas/traces/
# ./tool_reduce_gpx_size.sh
# Add template to  ~/private/projects/jesuisundesdeux/datas/traces/username_folder
# cd username_strava_folder
# python strava-to-file/jesuisundesdeux_summarize.py -d ~/private/projects/jesuisundesdeux/datas/traces/ -u (basename $(pwd))
```

### Generate heatmap with strava-local-heatmap
```
#cd strava-local-heatmap
#source .virtualenv/bin/activate
MAXNBTITLES=14
BOUNDSFRANCE=(49.382373 -5.328369 42.867912 11.90918)
BOUNDSPRS=(48.943926 2.23074 48.853308 2.510891)
BOUNDSMPT=(43.707842 3.572617 43.504986 4.135666)

#python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles #$MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france.png --csv-output 

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_france_all.png --csv-output --no-cdist


# Montpellier
python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier.png --csv-output

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_carrefour.png --csv-output


python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/heatmap_montpellier_all.png --csv-output --no-cdist

TRACEUSERS=($(ls ~/private/projects/jesuisundesdeux/datas/traces -p | egrep '/$' | sed 's/.$//'))
for TRACEUSER in $TRACEUSERS; do
    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france_all.png --csv-output --no-cdist

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_carrefour.png --csv-output


    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_all.png --csv-output --no-cdist
done
```