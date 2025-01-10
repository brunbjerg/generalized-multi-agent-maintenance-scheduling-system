set terminal lua tikz tex size 14cm,18cm color fontscale 1.0

set multiplot layout 2,1 title "Strategic Objective Values"

# Left Plot
# set title 'Objective Value for Weekly Schedule'
set timefmt "%Y-%m-%dT%H:%M:%S"

set style line 1 lc "#000000" lt 1 lw 2.5
set style line 2 lc "#2F3EEA" lt 1 lw 2.5

set ylabel "Strategic Objective Value" offset -5,0
set y2label "Strategic Urgency" offset 5,0


set format x ""
set xtics 60 rotate by 270
set ytics nomirror
set ytics  nomirror offset 0,1
set y2tics  offset 0,1


stats 'gnuplot_data.csv' using 1 nooutput
set key top right
set key box
set key width 2
set key spacing 2.5

set lmargin at screen 0.1
set rmargin at screen 0.9
set bmargin at screen 0.50
set tmargin at screen 0.95

set datafile separator ','
set grid linetype 1 linecolor "grey" lw 2 

plot \
	'gnuplot_data.csv' using ($1 - STATS_min):2 axes x1y1 with lines linestyle 1 title "Strategic Objective Value", \
	'gnuplot_data.csv' using ($1 - STATS_min):3 axes x1y2 with lines linestyle 2 title "Strategic Urgency", \

# Right Plot

set timefmt "%Y-%m-%dT%H:%M:%S"

set style line 3 lc "#008835" lt 1 lw 2.5
set style line 4 lc "#79238E" lt 1 lw 2.5

set xlabel "Relative time ($\\tau$) [S]" offset 0,-2
set ylabel "Strategic Resource Penalty [Hours]" offset -5,0
set y2label "Strategic Clustering Value" offset 5,0

set format x "%.0f"
set xtics 60 rotate by 270
set y2tics offset 0,-1
set ytics nomirror
set ytics offset 0,-1

stats 'gnuplot_data.csv' using 1 nooutput
set key top right
set key box
set key width 2
set key spacing 2.5

set lmargin at screen 0.1
set rmargin at screen 0.9
set bmargin at screen 0.0
set tmargin at screen 0.45

set datafile separator ','

set grid linetype 1 linecolor "grey" lw 2 
plot \
	'gnuplot_data.csv' using ($1 - STATS_min):4 axes x1y1 with lines linestyle 3 title "Strategic Resource Penalty", \
    'gnuplot_data.csv' using ($1 - STATS_min):5 axes x1y2 with lines linestyle 4 title "Strategic Clustering Value"

print "all done!"
