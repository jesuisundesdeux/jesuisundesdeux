### Cyclistes Montpelliérains à Montpellier

Les graphes ci-dessous sont générés grâce aux dons des traces par les cyclistes ci-dessous.

[Adelé Bruno](bruno.adele/README.md) |&nbsp;
[Blanchard Erick](erick.blanchard/README.md) |&nbsp;
[Bob Seb](seb.bob/README.md) |&nbsp;
[Bonnal Aurelien](aurelien.bonnal/README.md) |&nbsp;
[Brousse Cédric](cedric.brousse/README.md) |&nbsp;
[Dassonville Charles](charles.dassonville/README.md) |&nbsp;
[Erack Eric](eric.erack/README.md) |&nbsp;
[Favre Brice](brice.favre/README.md) |&nbsp;
[Girard Thomas](thomas.girard/README.md) |&nbsp;
[Amandine Du Lac](amandine.du.lac/README.md) |&nbsp;
[Latorre Rachel](traces/rachel.latorre/README.md) |&nbsp;
[Tyson Aurelien](traces/aurelien.tyson/README.md)


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
GPXUSERNAME="bruno.adele"
cd ~/tmp/gpx/${GPXUSERNAME}
source ~/private/projects/strava-to-file/.virtualenv/bin/activate
python ~/private/projects/strava-to-file/convert.py -d ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces -u $(basename $(pwd))
cd ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/
./tool_reduce_gpx_size.sh
# Add template to  ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/username_folder
cd ~/tmp/gpx/${GPXUSERNAME}
python ~/private/projects/strava-to-file/jesuisundesdeux_summarize.py -d ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/ -u $(basename $(pwd))
```

### Generate heatmap with strava-local-heatmap
```
cd ~/private/projects/strava-local-heatmap
source .virtualenv/bin/activate
MAXNBTITLES=14
BOUNDSFRANCE=(49.382373 -5.328369 42.867912 11.90918)
BOUNDSPRS=(48.943926 2.23074 48.853308 2.510891)
BOUNDSMPT=(43.707842 3.572617 43.504986 4.135666)

#python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles #$MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/heatmap_france.png --csv-output

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/heatmap_france_all.png --csv-output --no-cdist


# Montpellier
python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/heatmap_montpellier.png --csv-output

python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces --gpx-filter "**/*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/heatmap_montpellier_carrefour.png --csv-output


python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces --gpx-filter "**/*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/heatmap_montpellier_all.png --csv-output --no-cdist

TRACEUSERS=($(ls ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces -p | egrep '/$' | sed 's/.$//'))
for TRACEUSER in $TRACEUSERS; do
    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSFRANCE --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_france_all.png --csv-output --no-cdist

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier.png --csv-output

    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_junction_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_carrefour.png --csv-output


    python strava_local_heatmap.py --gpx-dir ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER --gpx-filter "*_reduced_trace.gpx" --max-tiles $MAXNBTITLES --gpx-bound $BOUNDSMPT --output ~/private/projects/jesuisundesdeux/jesuisundesdeux/datas/traces/$TRACEUSER/heatmap_user_montpellier_all.png --csv-output --no-cdist
done
```
