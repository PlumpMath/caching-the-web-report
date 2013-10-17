#!/bin/bash
rm bigFatResults 2> /dev/null

getRenderData(){
  # Some regular expressions picks out the data from the html-files
  startTime=$(grep startRender ./Testsidor/$filename | perl -ne 'print "$1" if m/(\d+.\d+)s<\/td>/')
  visualTime=$(grep visualComplate ./Testsidor/$filename | perl -ne 'print "$1" if m/(\d+.\d+)s<\/td>/')
}


i=0
for address in $(cat alexa.sites); do
  let i++;
  if [ ! -e ./Testsidor/$address.html ]; then
    continue
  fi
  line=$(echo $i $address $(grep fvBytes ./Testsidor/$address.html | grep -v fvBytesDoc | perl -ne 'print "$1" if m/(\d+|\d+,\d+) KB/'))
  line=$(echo $line $(grep rvBytes ./Testsidor/$address.html | grep -v rvBytesDoc | perl -ne 'print "$1" if m/(\d+|\d+,\d+) KB/'))

  filename=$address.details
  getRenderData
  line=$(echo $line $startTime $visualTime)
  filename=$address.reDetails
  getRenderData
  line=$(echo $line $startTime $visualTime)
  line=$(echo $line | sed "s|,||g")
  echo $line >> bigFatResults
done
