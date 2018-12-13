# Cyclistes de Montpellier

### Cyclistes Montpelliérains

**Carte à venir**

### Aurelien Tyson
<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_aurel.tyson.png" width="50%" >

### Bruno Adelé
<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_bruno.adele.png" width="50%" >

### Charles Dassonville
<img src="https://gitlab.com/JeSuisUnDesDeux/jesuisundesdeux/raw/master/datas/traces/heatmap_charles.dassonville.png" width="50%" >

### Generated with strava-local-heatmap
```
BOUNDS=(43.629366 3.835258 43.576101 3.97533)
TRACEUSERS=(aurel.tyson bruno.adele charles.dassonville)
for TRACEUSER in $TRACEUSERS; do
    echo "TRACEUSER: $TRACEUSER"
    python strava_local_heatmap.py -g ~/private/projects/jesuisundesdeux/datas/traces/$TRACEUSER -f "*_reduced_trace.gpx" -b $BOUNDS -p ~/private/projects/jesuisundesdeux/datas/traces/heatmap_$TRACEUSER.png -d ~/private/projects/jesuisundesdeux/datas/traces/heatmap_$TRACEUSER.csv
done
```