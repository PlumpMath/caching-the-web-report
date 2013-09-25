#!/bin/bash

ls ./Testsidor/ | grep html |  while read filename
do
  newName="${filename%.*}"
  wget -O ./Testsidor/$newName.details $(grep ">Details</a>" Testsidor/$filename | perl -ne 'print "$1" if m/(http:\/\/www.webpagetest.org\/result\/\w+\/1\/details)\//')
  wget -O ./Testsidor/$newName.revisit-details $(grep "/1/details/cached" Testsidor/$filename | perl -ne 'print "$1" if m/(http:\/\/www.webpagetest.org\/result\/\w+\/1\/details\/cached)\//')
done