set terminal lua tikz tex size 16cm,12cm color

set title 'Objective value for Weekly Schedule'
set timefmt "%Y-%m-%dT%H:%M:%S"

set style line 1 lc "#000000" lt 1 lw 2

set xlabel "Relative time ($\\tau$) [S]" offset 0,-2
set ylabel "Objective value" offset -6,0

set xtics rotate by 270
stats 'gnuplot_data.csv' using 1 nooutput
unset key
set datafile separator ','

set grid linetype 1 linecolor "grey" lw 2 

plot 'gnuplot_data.csv' using ($1 - STATS_min):2 with lines linestyle 1
print "all done!"
