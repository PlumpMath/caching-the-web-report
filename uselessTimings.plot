set title "Cache usage of the Alexa top 100 sites"
set key left top
set key Left reverse
set terminal postscript enhanced color solid lw 2 "Times-Roman" 7
set output 'bigFat.eps'
set style line 1 lt 1 pt 1 lc 12 ps 1
set style line 2 lt 1 pt 7 lc 2 ps 1
set style line 3 lt 1 pt 2 lc 7 ps 1

set xlabel "Site"
set ylabel "Seconds"
set xtics border in scale 1,0.5 nomirror rotate by -60  offset character 0, 0, 0
set xtics (0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840)
set yrange [0:15]

plot "bigFatResults" using 5:xticlabels(2) title "First visit start" with p ls 3 lc 7, \
     "bigFatResults" using 6:xticlabels(2) title "First visit finished" with p ls 3 lc 8, \
     "bigFatResults" using 7:xticlabels(2) title "Second visit start" with p ls 1 lc 9, \
     "bigFatResults" using 8:xticlabels(2) title "Second visit finished" with p ls 1 lc 3