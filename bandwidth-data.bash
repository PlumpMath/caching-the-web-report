#!/bin/bash

old_IFS=$IFS
IFS=$'\n'
# Remove the old files if they exist
rm dataFirstView > /dev/null
rm dataReView > /dev/null

# Loop through the result pages and push the results into the result files.
ls ./Testsidor/ | grep html |  while read filename
do
  temp=$(grep fvBytes ./Testsidor/$filename | grep -v fvBytesDoc | perl -ne 'print "$1+" if m/(\d+|\d+,\d+) KB/')
  echo -n $temp >> dataFirstView
  temp=$(grep rvBytes ./Testsidor/$filename | grep -v rvBytesDoc | perl -ne 'print "$1+" if m/(\d+|\d+,\d+) KB/')
  echo -n $temp >> dataReView
done

fileCount=$(ls ./Testsidor/ | grep html | wc -l)

# Cut off the trailing +
tmp=$(rev dataFirstView | cut -c2- | rev)
echo $tmp > dataFirstView
tmp=$(rev dataReView | cut -c2- | rev)
echo $tmp > dataReView

# Remove the thousands denominator ,
tmp=$(sed s/,//g dataFirstView)
echo "($tmp)/$fileCount" > dataFirstView
tmp=$(sed s/,//g dataReView)
echo "($tmp)/$fileCount" > dataReView

# We want to divide the totals by the number of samples
echo "Counting a total of $fileCount pages"
echo "The average size downloaded when visiting with a cold cache is $(cat dataFirstView | bc)kB"
echo "The average size downloaded when visiting with a warm cache is $(cat dataReView | bc)kB"

IFS=$old_IFS