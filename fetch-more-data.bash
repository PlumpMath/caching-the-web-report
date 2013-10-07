#!/bin/bash

ls ./Testsidor/ | grep html |  while read filename
do
  # Remove the file ending so that we get just the site name.
  newName="${filename%.*}"
  # Use perl regexp to search through the documents for the
  # addresses to the additional result pages, then download them.
  wget -O ./Testsidor/$newName.details $(grep ">Details</a>" Testsidor/$filename | perl -ne 'print "$1" if m/(http:\/\/www.webpagetest.org\/result\/\w+\/1\/details)\//')
  # Do the same to get the revisit result pages.
  wget -O ./Testsidor/$newName.reDetails $(grep "/1/details/cached" Testsidor/$filename | perl -ne 'print "$1" if m/(http:\/\/www.webpagetest.org\/result\/\w+\/1\/details\/cached)\//')
done