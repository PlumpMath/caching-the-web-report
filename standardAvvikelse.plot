reset
set sample 200
set table 'stats2.dat'
plot [0:10] 0.5+rand(0)
unset table

set yrange [0:2]
unset key
f(x) = mean_y
fit f(x) 'stats2.dat' u 1:2 via mean_y

stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1 ))

# Plotting the range of standard deviation with a shaded background
set label 1 gprintf("Mean = %g", mean_y) at 2, min_y-0.2
set label 2 gprintf("Standard deviation = %g", stddev_y) at 2, min_y-0.35
plot mean_y-stddev_y with filledcurves y1=mean_y lt 1 lc rgb "#bbbbdd", \
mean_y+stddev_y with filledcurves y1=mean_y lt 1 lc rgb "#bbbbdd", \
mean_y w l lt 3, 'stats2.dat' u 1:2 w p pt 7 lt 1 ps 1