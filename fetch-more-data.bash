#!/bin/bash

ls ./Testsidor/ | grep html |  while read filename
do
  wget -O ./Testsidor/$filename.details $(grep ">Details</a>" Testsidor/$filename | perl -ne 'print "$1" if m/(http:\/\/www.webpagetest.org\/result\/\w+\/1\/details)\//')
done