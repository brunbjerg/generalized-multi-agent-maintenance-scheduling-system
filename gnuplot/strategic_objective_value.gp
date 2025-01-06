set terminal lua tikz tex size 16cm,12cm color

set title 'Objective Value for Weekly Schedule'
set timefmt "%Y-%m-%dT%H:%M:%S"

set style line 1 lc "#000000" lt 1 lw 2.5
set style line 2 lc "#2F3EEA" lt 1 lw 2.5

set xlabel "Relative time ($\\tau$) [S]" offset 0,-2
set ylabel "Objective value" offset -6,0
set y2label "Resource Penalty [Hours]" offset 6,0

set xtics rotate by 270
set y2tics 
set ytics nomirror

stats 'gnuplot_data.csv' using 1 nooutput
set key top right
set key box
set key width 2
set key spacing 2.5

set datafile separator ','

set grid linetype 1 linecolor "grey" lw 2 

plot 'gnuplot_data.csv' using ($1 - STATS_min):2 with lines linestyle 1 title "Strategic urgency", \
	 'gnuplot_data.csv' using ($1 - STATS_min):3 axes x1y2 with lines linestyle 2 title "Strategic Resource penalty"

print "all done!"
