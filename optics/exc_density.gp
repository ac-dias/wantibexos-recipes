
set terminal pngcairo color size 1500,1000 


set palette rgbformulae 33,13,10 negative

unset key


set ylabel "k_{y} (Å^{-1})" font "Times-Roman,20" offset -1,0
set xlabel "k_{x} (Å^{-1})" font "Times-Roman,20" offset 0,-1

#set yrange[-1.5:1.5]
#set yrange[0:20]
#set xrange[-1.5:1.5]

set lmargin 10
set rmargin 5
set bmargin 5

set cbrange[0:0.05]
set cbtics 0,0.01,0.05

set yrange[0:3.5]
set ytics 0,0.5,3.5

set xrange[0:2]
set xtics 0,0.5,2


set output 'exc_density.png'

set tics font "Times-Roman,20"

set multiplot layout 2,3

unset key
#########################################################################

set title '(a) Exciton 1 (1.65 eV)' font "Times-Roman,20"

plot './out/exc_den_1.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "

#########################################################################

set title '(b) Exciton 2 (1.65 eV) ' font "Times-Roman,20"

plot './out/exc_den_2.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "

#########################################################################

set title '(c) Exciton 3 (1.66 eV)' font "Times-Roman,20"

plot './out/exc_den_3.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "

#########################################################################

set title '(d) Exciton 4 (1.66 eV) ' font "Times-Roman,20"

plot './out/exc_den_4.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "

#########################################################################

set title '(e) Exciton 5 (1.82 eV) ' font "Times-Roman,20"

plot './out/exc_den_5.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "

#########################################################################

set title '(f) Exciton 6 (1.82 eV)' font "Times-Roman,20"

plot './out/exc_den_6.dat' u 1:2:4 w points pointtype 7 ps 0.8 lw 2 palette t " "



#########################################################################





unset multiplot


