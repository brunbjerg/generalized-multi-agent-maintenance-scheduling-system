set terminal lua tikz tex size 16cm,12cm color
set output 'strategic_objective_value_exclusion_plot.tex'

set title 'Objective value for Weekly Schedule'
set xlabel "Absolute time"
set ylabel "Objective value"
set xtics rotate by 270
set xtics out
unset key
set datafile separator ','
plot '<cat' using 1:2 with lines
print "all done!"
