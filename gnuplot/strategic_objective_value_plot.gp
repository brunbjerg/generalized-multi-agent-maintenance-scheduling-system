set terminal lua tikz tex size 16cm,12cm
set output 'test_plot.tex'
set title
set datafile separator ','
plot '<cat' using 1:2 with lines
print "all done!"
