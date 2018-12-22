#!/bin/bash

# https://www.routeconverter.de/stable-releases/en

echo "Reducing ..."
for orig in $(ls */*_converted_trace.gpx.gz); do
    gpxname="${orig/\.gz/}"

    unziped=$(echo $orig | sed 's/_converted_trace\.gpx\.gz/_unziped_trace.gpx/')
    privatized=$(echo $orig | sed 's/_converted_trace\.gpx\.gz/_privatized_trace.gpx/')
    reduced=$(echo $orig | sed 's/_converted_trace\.gpx\.gz/_reduced_trace.gpx/')
    junction=$(echo $orig | sed 's/_converted_trace\.gpx\.gz/_junction_trace.gpx/')

    if [ ! -f $privatized -o ! -f $reduced -o ! -f $junction ]; then
        echo "$orig $unziped"
        gunzip -c "$orig" > "$unziped"

        if [ ! -f $privatized ]; then
            FIRST=$(egrep -m1 -o "lat=\"[0-9\.]+\" lon=\"[0-9\.]+\"" "$unziped" | awk '{print $1","$2}' | tr -d '"' )
            LAST=$(egrep -o "lat=\"[0-9\.]+\" lon=\"[0-9\.]+\"" "$unziped" | tail -1 | awk '{print $1","$2}' | tr -d '"' )

            gpsbabel -i gpx -f "$unziped" \
            -x transform,wpt=trk,del \
            -x radius,distance=0.3k,$FIRST,nosort,exclude \
            -x radius,distance=0.3k,$LAST,nosort,exclude \
            -x transform,trk=wpt,del \
            -o gpx -F "$privatized"
        fi


        if [ ! -f "$reduced" -o ! -f "$junction" ]; then
            echo "Processing $privatized"

            #Used with strava-local-heatmap
            if [ ! -f "$reduced" ]; then
                echo "Reducing $gpxname file"
                gpsbabel -i gpx -f "$privatized" -x position,distance=20m -o gpx -F "$reduced"
            fi

            # Used with strava-local-heatmap (For showing road junction)
            if [ ! -f "$junction" ]; then
                echo "Detecting road junction for $gpxname"
                gpsbabel -i gpx -f "$privatized" -x simplify,crosstrack,error=0.020k -o gpx -F "$junction"        
            fi
        fi

        # Delete unziped file
        if [ -f "$unziped" ]; then 
            rm "$unziped"
        fi

    fi
done