################################################################################################################################
# Use this file to generate 1 graph for each player. This file will read 3 files as inputs (input 1, 2 and 3). All file should have time in column 1 (starting from 0). The file input1 should have the buffer occupancy at column 2, the file input2 should have the quality to which the stream changed in column 2 and input3 should have the quality index of the request in column 2(0 for lowest quality and +1 for each quality above that). Please change the x and y scales according to the time scales in your simulations ussing the commands set xrange and set yrange. This file requires gnuplot program to execute, it is natively available in the lab PCs, if you want to generate these graphs in your PCs, you can get gnuplot using 'apt-get install gnuplot' on debian/ubuntu PCs. Windows users require Cygwin and gnuplot libraries for cygwin to generate these graphs. Use the command 'gnuplot graph.plot' to run the script, make sure that all the files are in the same directory, or use suitable paths. The program will generate an eps file, once it is created convert it to PDf using 'epstopdf output.eps'. The resulting PDF file should be submitted in the report along with other discussion.
#############################################################################################################################
set title "Site size vs. Time until visually complete"
set key left top
set key Left reverse
set terminal postscript enhanced color solid lw 2 "Times-Roman" 16
set output 'bigFat.eps'
set style line 1 lt 1 pt 1 lc 12 ps 1
set style line 2 lt 1 pt 7 lc 2 ps 1
set style line 3 lt 1 pt 2 lc 7 ps 1

set xlabel "Size of data loaded"
set ylabel "Seconds until visually complete"
set xtics border in scale 1,0.5 nomirror rotate by 0  offset character 0, 0, 0
set yrange [0:15]
set xrange [0:2000]

plot "bigFatResults" using 3:6 title "Site" with p ls 3 lc 7