#!/bin/bash
old_IFS=$IFS
IFS=$'\n'
ls ./Testsidor/ | grep html |  while read filename
do
    # Replace _ with : and do it for all occurences on the line.
    newfilename="$(echo $filename | sed -e 's/_/:/g')"
    newfilename="$(echo $newfilename | sed -e 's/^\w* \w* \w* - \w* : //')"
    newfilename="$(echo $newfilename | sed -e 's/ - \w*:\w*:\w* \w*:\w*:\w*.html$/.html/')"
    echo "$filename to $newfilename";
    mv ./Testsidor/"$filename" ./Testsidor/"$newfilename"
done
IFS=$old_IFS