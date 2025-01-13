set terminal lua tikz tex size 16cm,12cm color fontscale 1.0

# set title 'Objective Values for Weekly Schedule' offset 0,5
set timefmt "%Y-%m-%dT%H:%M:%S"

set style line 1 lc "#000000" lt 1 lw 2.5
set style line 2 lc "#2F3EEA" lt 1 lw 2.5

set xlabel "Relative time ($\\tau$) [Seconds]" offset 0,-2
set ylabel "Strategic Urgency [Weighted Tardiness]" offset -5,0
set y2label "Strategic Resource Penalty [Hours]" offset 5,0

set xtics 60 rotate by 270
set ytics nomirror
set ytics  nomirror offset 0,1
set y2tics  offset 0,1

stats 'gnuplot_data.csv' using 1 nooutput
set key top right
set key box
set key outside above offset 0,2.5
set key width 2
set key spacing 2.5

# set lmargin at screen 0.1
# set rmargin at screen 0.9
# set bmargin at screen 0.50
# set tmargin at screen 0.95

set datafile separator ','
set grid linetype 1 linecolor "grey" lw 2 

plot \
	'gnuplot_data.csv' using ($1 - STATS_min):3 axes x1y1 with lines linestyle 1 title "Strategic Urgency", \
	'gnuplot_data.csv' using ($1 - STATS_min):4 axes x1y2 with lines linestyle 2 title "Strategic Resource Penalty", \

print "all done!"
